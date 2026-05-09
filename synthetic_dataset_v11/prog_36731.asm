; DESCRIPTION: Draws a red line from (140, 150) to (237, 128).
; PLAN: r0=140(x1), r1=150(y1), r2=237(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 150
LDI r2, 237
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
