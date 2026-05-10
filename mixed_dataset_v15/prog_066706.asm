; DESCRIPTION: Places a green line segment connecting (421, 245) to (217, 202).
; PLAN: r0=421(x1), r1=245(y1), r2=217(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 245
LDI r2, 217
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
