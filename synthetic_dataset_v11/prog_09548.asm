; DESCRIPTION: Places a white line segment connecting (62, 27) to (166, 143).
; PLAN: r0=62(x1), r1=27(y1), r2=166(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 27
LDI r2, 166
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
