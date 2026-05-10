; DESCRIPTION: Places a green line segment connecting (39, 206) to (104, 73).
; PLAN: r0=39(x1), r1=206(y1), r2=104(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 206
LDI r2, 104
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
