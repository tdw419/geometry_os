; DESCRIPTION: Draws a yellow line from (505, 228) to (119, 72).
; PLAN: r0=505(x1), r1=228(y1), r2=119(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 228
LDI r2, 119
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
