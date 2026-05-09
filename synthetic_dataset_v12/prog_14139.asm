; DESCRIPTION: Draws a green line from (59, 78) to (134, 236).
; PLAN: r0=59(x1), r1=78(y1), r2=134(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 78
LDI r2, 134
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
