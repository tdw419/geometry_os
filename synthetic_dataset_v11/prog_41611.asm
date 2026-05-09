; DESCRIPTION: Places a white line segment connecting (48, 149) to (183, 253).
; PLAN: r0=48(x1), r1=149(y1), r2=183(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 149
LDI r2, 183
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
