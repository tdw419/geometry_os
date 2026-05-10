; DESCRIPTION: Draws a yellow line from (42, 55) to (221, 184).
; PLAN: r0=42(x1), r1=55(y1), r2=221(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 55
LDI r2, 221
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
