; target_reticle.asm -- Military-style targeting reticle
; Green crosshairs and concentric circles on black background

; Screen center = (128, 128)
LDI r0, 128       ; center x
LDI r1, 128       ; center y
LDI r15, 0x00CC00 ; green color

; Outer circle radius 100
LDI r2, 100
CIRCLE r0, r1, r2, r15

; Middle circle radius 60
LDI r2, 60
CIRCLE r0, r1, r2, r15

; Inner circle radius 20
LDI r2, 20
CIRCLE r0, r1, r2, r15

; Bright green for crosshair lines
LDI r15, 0x00FF00

; Horizontal crosshair line (full width through center)
LDI r2, 0
LDI r3, 255
LINE r2, r1, r3, r1, r15

; Vertical crosshair line (full height through center)
LINE r0, r2, r0, r3, r15

; Dim green for tick marks on outer circle
LDI r15, 0x006600

; Top tick on outer circle (128-100=28, length 10)
LDI r2, 28
LDI r3, 18
LINE r0, r2, r0, r3, r15

; Bottom tick (128+100=228, length 10)
LDI r2, 228
LDI r3, 238
LINE r0, r2, r0, r3, r15

; Left tick
LDI r2, 28
LDI r3, 18
LINE r2, r1, r3, r1, r15

; Right tick
LDI r2, 228
LDI r3, 238
LINE r2, r1, r3, r1, r15

HALT
