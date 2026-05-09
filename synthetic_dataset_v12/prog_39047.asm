; DESCRIPTION: Places a white line segment connecting (240, 253) to (150, 194).
; PLAN: r0=240(x1), r1=253(y1), r2=150(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 253
LDI r2, 150
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
