; DESCRIPTION: Draws a yellow line from (53, 205) to (82, 76).
; PLAN: r0=53(x1), r1=205(y1), r2=82(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 205
LDI r2, 82
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
