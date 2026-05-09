; DESCRIPTION: Draws a blue line from (9, 58) to (13, 228).
; PLAN: r0=9(x1), r1=58(y1), r2=13(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 58
LDI r2, 13
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
