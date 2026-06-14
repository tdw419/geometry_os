; DIAMOND -- Draw a diamond outline using 4 lines in cyan
; Vertices: top(128,0), right(255,128), bottom(128,255), left(0,128)

LDI r10, 0x00FFFF    ; cyan color

; Top to right: (128,0) to (255,128)
LDI r0, 128
LDI r1, 0
LDI r2, 255
LDI r3, 128
LINE r0, r1, r2, r3, r10

; Right to bottom: (255,128) to (128,255)
LDI r0, 255
LDI r1, 128
LDI r2, 128
LDI r3, 255
LINE r0, r1, r2, r3, r10

; Bottom to left: (128,255) to (0,128)
LDI r0, 128
LDI r1, 255
LDI r2, 0
LDI r3, 128
LINE r0, r1, r2, r3, r10

; Left to top: (0,128) to (128,0)
LDI r0, 0
LDI r1, 128
LDI r2, 128
LDI r3, 0
LINE r0, r1, r2, r3, r10

HALT
