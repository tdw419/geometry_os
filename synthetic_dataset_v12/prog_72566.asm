; DESCRIPTION: Draws a green line from (167, 56) to (135, 36).
; PLAN: r0=167(x1), r1=56(y1), r2=135(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 56
LDI r2, 135
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
