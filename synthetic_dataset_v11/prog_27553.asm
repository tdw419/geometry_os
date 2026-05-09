; DESCRIPTION: Composite: . Then Places a black line segment connecting (76, 10) to (220, 135). Then Places a red dot at position (79, 95).
; PLAN: r0=76(x1), r1=10(y1), r2=220(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=79(x), r1=95(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (76, 10) to (220, 135).
; PLAN: r0=76(x1), r1=10(y1), r2=220(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 10
LDI r2, 220
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (79, 95).
; PLAN: r0=79(x), r1=95(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 95
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
