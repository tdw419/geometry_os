; DESCRIPTION: Draws a blue line from (52, 154) to (218, 126).
; PLAN: r0=52(x1), r1=154(y1), r2=218(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 154
LDI r2, 218
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
