; DESCRIPTION: Draws a cyan line from (244, 11) to (59, 155).
; PLAN: r0=244(x1), r1=11(y1), r2=59(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 11
LDI r2, 59
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
