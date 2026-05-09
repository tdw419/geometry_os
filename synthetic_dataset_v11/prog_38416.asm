; DESCRIPTION: Composite: . Then Draws a purple line from (254, 130) to (56, 241). Then Draws a cyan circle centered at (140, 172) with radius 60.
; PLAN: r0=254(x1), r1=130(y1), r2=56(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=140(x), r1=172(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple line from (254, 130) to (56, 241).
; PLAN: r0=254(x1), r1=130(y1), r2=56(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 130
LDI r2, 56
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan circle centered at (140, 172) with radius 60.
; PLAN: r0=140(x), r1=172(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 172
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
