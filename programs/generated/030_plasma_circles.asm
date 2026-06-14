; 030_plasma_circles.asm -- Plasma-like bokeh effect with overlapping colored circles
; Dark background with large, overlapping translucent-looking colored circles

; Dark background
LDI r0, 0x111122
FILL r0

; Red circle top-left
LDI r0, 80
LDI r1, 80
LDI r2, 60
LDI r3, 0xCC2222
CIRCLE r0, r1, r2, r3

; Green circle top-right
LDI r0, 190
LDI r1, 70
LDI r2, 55
LDI r3, 0x22CC44
CIRCLE r0, r1, r2, r3

; Blue circle center
LDI r0, 128
LDI r1, 128
LDI r2, 65
LDI r3, 0x2244CC
CIRCLE r0, r1, r2, r3

; Yellow circle bottom-left
LDI r0, 60
LDI r1, 190
LDI r2, 50
LDI r3, 0xCCCC22
CIRCLE r0, r1, r2, r3

; Magenta circle bottom-right
LDI r0, 200
LDI r1, 200
LDI r2, 55
LDI r3, 0xCC22CC
CIRCLE r0, r1, r2, r3

; Cyan circle center-right
LDI r0, 200
LDI r1, 130
LDI r2, 45
LDI r3, 0x22CCCC
CIRCLE r0, r1, r2, r3

; Orange circle center-left
LDI r0, 50
LDI r1, 140
LDI r2, 45
LDI r3, 0xFF8822
CIRCLE r0, r1, r2, r3

; White highlight center
LDI r0, 128
LDI r1, 128
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3

HALT
