; DESCRIPTION: Draws a red line from (108, 63) to (302, 154).
; PLAN: r0=108(x1), r1=63(y1), r2=302(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 63
LDI r2, 302
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
