; DESCRIPTION: Places a green line segment connecting (243, 206) to (68, 157).
; PLAN: r0=243(x1), r1=206(y1), r2=68(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 206
LDI r2, 68
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
