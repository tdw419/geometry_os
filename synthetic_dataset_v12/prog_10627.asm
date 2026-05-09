; DESCRIPTION: Draws a yellow line from (394, 105) to (182, 42).
; PLAN: r0=394(x1), r1=105(y1), r2=182(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 105
LDI r2, 182
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
