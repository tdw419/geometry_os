; DESCRIPTION: Composite: . Then Draws a blue circle centered at (186, 169) with radius 34. Then Places a green dot at position (9, 187).
; PLAN: r0=186(x), r1=169(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=9(x), r1=187(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (186, 169) with radius 34.
; PLAN: r0=186(x), r1=169(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 169
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (9, 187).
; PLAN: r0=9(x), r1=187(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 187
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
