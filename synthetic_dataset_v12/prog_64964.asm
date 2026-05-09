; DESCRIPTION: Places a green line segment connecting (495, 206) to (74, 82).
; PLAN: r0=495(x1), r1=206(y1), r2=74(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 206
LDI r2, 74
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
