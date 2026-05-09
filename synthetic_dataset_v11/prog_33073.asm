; DESCRIPTION: Draws a green line from (250, 48) to (167, 0).
; PLAN: r0=250(x1), r1=48(y1), r2=167(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 48
LDI r2, 167
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
