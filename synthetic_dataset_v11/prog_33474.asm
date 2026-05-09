; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (108, 113). Then Draws a purple line from (78, 105) to (50, 40).
; PLAN: r0=108(x), r1=113(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=78(x1), r1=105(y1), r2=50(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (108, 113).
; PLAN: r0=108(x), r1=113(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 113
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (78, 105) to (50, 40).
; PLAN: r0=78(x1), r1=105(y1), r2=50(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 105
LDI r2, 50
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
