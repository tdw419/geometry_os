; DESCRIPTION: Draws a blue line from (102, 16) to (246, 210).
; PLAN: r0=102(x1), r1=16(y1), r2=246(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 16
LDI r2, 246
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
