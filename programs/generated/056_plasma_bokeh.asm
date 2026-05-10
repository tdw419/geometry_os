; PLASMA BOKEH -- Large overlapping colored circles on dark background
; Creates a plasma-like color mixing effect

; Dark background fill
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x080812
FILL r4

; Large overlapping circles (bokeh effect)
; Red-orange, top-left area
LDI r0, 70
LDI r1, 70
LDI r2, 100
LDI r3, 0xFF2200
CIRCLE r0, r1, r2, r3

; Green, top-right area
LDI r0, 190
LDI r1, 60
LDI r2, 110
LDI r3, 0x00CC44
CIRCLE r0, r1, r2, r3

; Blue, bottom-center
LDI r0, 128
LDI r1, 190
LDI r2, 120
LDI r3, 0x0044FF
CIRCLE r0, r1, r2, r3

; Yellow, center
LDI r0, 128
LDI r1, 128
LDI r2, 80
LDI r3, 0xFFDD00
CIRCLE r0, r1, r2, r3

; Magenta, bottom-left
LDI r0, 50
LDI r1, 200
LDI r2, 90
LDI r3, 0xFF00AA
CIRCLE r0, r1, r2, r3

; Cyan, right edge
LDI r0, 210
LDI r1, 150
LDI r2, 95
LDI r3, 0x00DDFF
CIRCLE r0, r1, r2, r3

; Orange, top-center
LDI r0, 140
LDI r1, 40
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3

HALT
