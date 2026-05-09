; DESCRIPTION: Draws a blue line from (398, 37) to (292, 154).
; PLAN: r0=398(x1), r1=37(y1), r2=292(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 37
LDI r2, 292
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
