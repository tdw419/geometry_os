; DESCRIPTION: Draws a green line from (247, 0) to (220, 75).
; PLAN: r0=247(x1), r1=0(y1), r2=220(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 0
LDI r2, 220
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
