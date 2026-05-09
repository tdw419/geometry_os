; DESCRIPTION: Draws a red line from (107, 42) to (105, 222).
; PLAN: r0=107(x1), r1=42(y1), r2=105(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 42
LDI r2, 105
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
