; DESCRIPTION: Composite: . Then Renders a black line between points (36, 164) and (38, 65). Then Places a red dot at position (79, 228).
; PLAN: r0=36(x1), r1=164(y1), r2=38(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=79(x), r1=228(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (36, 164) and (38, 65).
; PLAN: r0=36(x1), r1=164(y1), r2=38(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 164
LDI r2, 38
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (79, 228).
; PLAN: r0=79(x), r1=228(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 228
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
