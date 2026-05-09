; DESCRIPTION: Places a green circle of radius 68 at center (320, 77).
; PLAN: r0=320(x), r1=77(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 77
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
