; DESCRIPTION: Draws a green line from (169, 228) to (182, 96).
; PLAN: r0=169(x1), r1=228(y1), r2=182(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 228
LDI r2, 182
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
