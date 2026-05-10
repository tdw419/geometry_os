; DESCRIPTION: Draws a magenta line from (154, 64) to (474, 178).
; PLAN: r0=154(x1), r1=64(y1), r2=474(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 64
LDI r2, 474
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
