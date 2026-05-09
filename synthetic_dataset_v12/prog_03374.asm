; DESCRIPTION: Draws a red line from (142, 149) to (172, 228).
; PLAN: r0=142(x1), r1=149(y1), r2=172(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 149
LDI r2, 172
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
