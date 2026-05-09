; DESCRIPTION: Renders a magenta line between points (252, 128) and (247, 239).
; PLAN: r0=252(x1), r1=128(y1), r2=247(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 128
LDI r2, 247
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
