; DESCRIPTION: Draws a yellow line from (172, 95) to (42, 186).
; PLAN: r0=172(x1), r1=95(y1), r2=42(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 95
LDI r2, 42
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
