; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (221, 60). Then Draws a black line from (185, 116) to (68, 95).
; PLAN: r0=221(x), r1=60(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=185(x1), r1=116(y1), r2=68(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (221, 60).
; PLAN: r0=221(x), r1=60(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 60
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (185, 116) to (68, 95).
; PLAN: r0=185(x1), r1=116(y1), r2=68(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 116
LDI r2, 68
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
