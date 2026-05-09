; DESCRIPTION: Places a white line segment connecting (82, 1) to (371, 246).
; PLAN: r0=82(x1), r1=1(y1), r2=371(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 1
LDI r2, 371
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
