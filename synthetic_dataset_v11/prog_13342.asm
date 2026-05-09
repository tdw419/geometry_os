; DESCRIPTION: Composite: . Then Sets a single purple pixel at (132, 38). Then Draws a green line from (76, 49) to (172, 103).
; PLAN: r0=132(x), r1=38(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=76(x1), r1=49(y1), r2=172(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (132, 38).
; PLAN: r0=132(x), r1=38(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 38
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (76, 49) to (172, 103).
; PLAN: r0=76(x1), r1=49(y1), r2=172(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 49
LDI r2, 172
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
