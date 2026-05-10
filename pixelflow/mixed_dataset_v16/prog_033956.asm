; DESCRIPTION: Draws a blue line from (14, 9) to (208, 42).
; PLAN: r0=14(x1), r1=9(y1), r2=208(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 9
LDI r2, 208
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
