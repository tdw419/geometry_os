; DESCRIPTION: Draws a yellow line from (481, 95) to (291, 63).
; PLAN: r0=481(x1), r1=95(y1), r2=291(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 95
LDI r2, 291
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
