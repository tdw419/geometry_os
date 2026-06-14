; Hardware Sprite Layer Demo (Phase 441)
; Demonstrates sprite layer compositing with z-order and alpha blending

LDI r10, 0x5000       ; sprite data base address
LDI r11, 0xFF0000     ; red color
LDI r12, 0x00FF00     ; green color
LDI r13, 0x0000FF     ; blue color
LDI r14, 16           ; sprite width/height

; Draw a red square to layer 0
LDI r0, 0             ; layer_id 0
LDI r1, 0x5000        ; source addr
LDI r2, 32            ; x position
LDI r3, 32            ; y position
LDI r4, 16            ; width
LDI r5, 16            ; height
LDI r6, 0             ; blend mode (opaque)
LDI r7, 255           ; alpha
SPRITELAYER r0, r1, r2, r3, r4, r5, r6, r7

; Draw a green square to layer 1 with higher z-order
LDI r0, 1             ; layer_id 1
LDI r1, 0x5200        ; source addr
LDI r2, 64            ; x position
LDI r3, 64            ; y position
LDI r4, 16            ; width
LDI r5, 16            ; height
LDI r6, 0             ; blend mode (opaque)
LDI r7, 255           ; alpha
SPRITELAYER r0, r1, r2, r3, r4, r5, r6, r7

; Set layer 0 z-order to 1
LDI r0, 0             ; layer_id 0
LDI r1, 2             ; operation 2 = set z-order
LDI r2, 1             ; z-order value
SPRITELAYER r0, r1, r2, 0, 0, 0, 0, 0

; Set layer 1 z-order to 2 (draws on top of layer 0)
LDI r0, 1             ; layer_id 1
LDI r1, 2             ; operation 2 = set z-order
LDI r2, 2             ; z-order value
SPRITELAYER r0, r1, r2, 0, 0, 0, 0, 0

; Compose all layers to main screen
LDI r0, 255           ; layer_id 255 = compose all
LDI r1, 3             ; operation 3 = compose
SPRITELAYER r0, r1, 0, 0, 0, 0, 0, 0

FRAME
HALT