; DESCRIPTION: Draws a red line from (187, 51) to (257, 176).
; PLAN: r0=187(x1), r1=51(y1), r2=257(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 51
LDI r2, 257
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
