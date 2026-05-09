; DESCRIPTION: Draws a blue line from (212, 69) to (479, 0).
; PLAN: r0=212(x1), r1=69(y1), r2=479(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 69
LDI r2, 479
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
