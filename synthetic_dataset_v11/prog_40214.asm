; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (86, 24). Then Places a orange line segment connecting (40, 22) to (121, 6).
; PLAN: r0=86(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=40(x1), r1=22(y1), r2=121(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (86, 24).
; PLAN: r0=86(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (40, 22) to (121, 6).
; PLAN: r0=40(x1), r1=22(y1), r2=121(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 22
LDI r2, 121
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
