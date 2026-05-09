; DESCRIPTION: Draws a red line from (69, 31) to (32, 3).
; PLAN: r0=69(x1), r1=31(y1), r2=32(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 31
LDI r2, 32
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
