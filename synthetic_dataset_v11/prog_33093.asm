; DESCRIPTION: Places a white line segment connecting (69, 38) to (126, 39).
; PLAN: r0=69(x1), r1=38(y1), r2=126(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 38
LDI r2, 126
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
