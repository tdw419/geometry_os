; DESCRIPTION: Draws a magenta line from (209, 128) to (253, 234).
; PLAN: r0=209(x1), r1=128(y1), r2=253(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 128
LDI r2, 253
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
