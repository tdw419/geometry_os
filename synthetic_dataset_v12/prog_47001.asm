; DESCRIPTION: Places a white line segment connecting (418, 195) to (48, 247).
; PLAN: r0=418(x1), r1=195(y1), r2=48(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 195
LDI r2, 48
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
