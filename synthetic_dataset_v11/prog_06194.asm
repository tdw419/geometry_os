; DESCRIPTION: Draws a magenta line from (173, 139) to (107, 184).
; PLAN: r0=173(x1), r1=139(y1), r2=107(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 139
LDI r2, 107
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
