; DESCRIPTION: Draws a red line from (263, 94) to (498, 32).
; PLAN: r0=263(x1), r1=94(y1), r2=498(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 94
LDI r2, 498
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
