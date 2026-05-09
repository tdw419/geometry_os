; DESCRIPTION: Draws a blue line from (60, 228) to (6, 194).
; PLAN: r0=60(x1), r1=228(y1), r2=6(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 228
LDI r2, 6
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
