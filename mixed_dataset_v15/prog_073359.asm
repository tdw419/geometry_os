; DESCRIPTION: Places a green line segment connecting (39, 43) to (287, 228).
; PLAN: r0=39(x1), r1=43(y1), r2=287(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 43
LDI r2, 287
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
