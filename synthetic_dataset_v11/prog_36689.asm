; DESCRIPTION: Composite: . Then Draws a orange circle centered at (71, 49) with radius 43. Then Draws a green line from (160, 210) to (228, 7).
; PLAN: r0=71(x), r1=49(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=160(x1), r1=210(y1), r2=228(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (71, 49) with radius 43.
; PLAN: r0=71(x), r1=49(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 49
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (160, 210) to (228, 7).
; PLAN: r0=160(x1), r1=210(y1), r2=228(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 210
LDI r2, 228
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
