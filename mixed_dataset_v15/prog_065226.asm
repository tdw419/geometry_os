; DESCRIPTION: Draws a blue line from (499, 13) to (152, 42).
; PLAN: r0=499(x1), r1=13(y1), r2=152(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 13
LDI r2, 152
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
