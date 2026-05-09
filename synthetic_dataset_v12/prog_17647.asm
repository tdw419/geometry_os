; DESCRIPTION: Draws a magenta line from (43, 221) to (447, 55).
; PLAN: r0=43(x1), r1=221(y1), r2=447(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 221
LDI r2, 447
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
