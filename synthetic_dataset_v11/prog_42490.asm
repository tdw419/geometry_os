; DESCRIPTION: Places a red line segment connecting (206, 172) to (87, 127).
; PLAN: r0=206(x1), r1=172(y1), r2=87(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 172
LDI r2, 87
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
