; DESCRIPTION: Places a white line segment connecting (153, 108) to (228, 83).
; PLAN: r0=153(x1), r1=108(y1), r2=228(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 108
LDI r2, 228
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
