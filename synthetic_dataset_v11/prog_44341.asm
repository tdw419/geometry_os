; DESCRIPTION: Composite: . Then Draws a cyan line from (1, 92) to (98, 244). Then Draws a orange circle centered at (93, 134) with radius 73.
; PLAN: r0=1(x1), r1=92(y1), r2=98(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=93(x), r1=134(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (1, 92) to (98, 244).
; PLAN: r0=1(x1), r1=92(y1), r2=98(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 92
LDI r2, 98
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (93, 134) with radius 73.
; PLAN: r0=93(x), r1=134(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 134
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
