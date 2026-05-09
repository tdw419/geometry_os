; DESCRIPTION: Draws a yellow line from (50, 126) to (138, 96).
; PLAN: r0=50(x1), r1=126(y1), r2=138(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 126
LDI r2, 138
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
