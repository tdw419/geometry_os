; DESCRIPTION: Draws a yellow line from (82, 46) to (210, 137).
; PLAN: r0=82(x1), r1=46(y1), r2=210(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 46
LDI r2, 210
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
