; DESCRIPTION: Draws a magenta line from (253, 128) to (161, 50).
; PLAN: r0=253(x1), r1=128(y1), r2=161(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 128
LDI r2, 161
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
