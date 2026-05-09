; DESCRIPTION: Composite: . Then Creates a orange circular shape at (144, 132) with radius 40. Then Renders a white line between points (29, 230) and (218, 94).
; PLAN: r0=144(x), r1=132(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=29(x1), r1=230(y1), r2=218(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (144, 132) with radius 40.
; PLAN: r0=144(x), r1=132(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 132
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (29, 230) and (218, 94).
; PLAN: r0=29(x1), r1=230(y1), r2=218(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 230
LDI r2, 218
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
