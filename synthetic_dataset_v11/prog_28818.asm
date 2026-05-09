; DESCRIPTION: Composite: . Then Draws a green circle centered at (114, 105) with radius 46. Then Draws a white line from (135, 218) to (164, 184).
; PLAN: r0=114(x), r1=105(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=135(x1), r1=218(y1), r2=164(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (114, 105) with radius 46.
; PLAN: r0=114(x), r1=105(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 105
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (135, 218) to (164, 184).
; PLAN: r0=135(x1), r1=218(y1), r2=164(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 218
LDI r2, 164
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
