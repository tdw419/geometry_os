; DESCRIPTION: Places a red line segment connecting (43, 253) to (160, 103).
; PLAN: r0=43(x1), r1=253(y1), r2=160(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 253
LDI r2, 160
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
