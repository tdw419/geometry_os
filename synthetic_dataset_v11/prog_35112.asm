; DESCRIPTION: Places a green line segment connecting (68, 39) to (238, 198).
; PLAN: r0=68(x1), r1=39(y1), r2=238(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 39
LDI r2, 238
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
