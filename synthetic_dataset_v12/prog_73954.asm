; DESCRIPTION: Draws a green line from (68, 234) to (59, 60).
; PLAN: r0=68(x1), r1=234(y1), r2=59(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 234
LDI r2, 59
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
