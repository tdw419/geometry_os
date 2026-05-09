; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (77, 193) with radius 22. Then Renders a white line between points (119, 181) and (3, 164).
; PLAN: r0=77(x), r1=193(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=119(x1), r1=181(y1), r2=3(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (77, 193) with radius 22.
; PLAN: r0=77(x), r1=193(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 193
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (119, 181) and (3, 164).
; PLAN: r0=119(x1), r1=181(y1), r2=3(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 181
LDI r2, 3
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
