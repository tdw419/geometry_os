; DESCRIPTION: Draws a magenta line from (228, 128) to (37, 9).
; PLAN: r0=228(x1), r1=128(y1), r2=37(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 128
LDI r2, 37
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
