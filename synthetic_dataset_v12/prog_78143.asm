; DESCRIPTION: Draws a red line from (470, 188) to (154, 222).
; PLAN: r0=470(x1), r1=188(y1), r2=154(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 188
LDI r2, 154
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
