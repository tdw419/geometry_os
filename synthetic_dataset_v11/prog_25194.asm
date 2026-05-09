; DESCRIPTION: Places a red line segment connecting (135, 206) to (166, 50).
; PLAN: r0=135(x1), r1=206(y1), r2=166(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 206
LDI r2, 166
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
