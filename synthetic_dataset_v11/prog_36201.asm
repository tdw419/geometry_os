; DESCRIPTION: Composite: . Then Sets a single green pixel at (38, 1). Then Draws a orange line from (130, 5) to (90, 48).
; PLAN: r0=38(x), r1=1(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=130(x1), r1=5(y1), r2=90(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (38, 1).
; PLAN: r0=38(x), r1=1(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 1
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a orange line from (130, 5) to (90, 48).
; PLAN: r0=130(x1), r1=5(y1), r2=90(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 5
LDI r2, 90
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
