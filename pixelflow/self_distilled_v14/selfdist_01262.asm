; DESCRIPTION: Draws a blue line from (215, 68) to (301, 171).
; PLAN: r0=215(x1), r1=68(y1), r2=301(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 68
LDI r2, 301
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
