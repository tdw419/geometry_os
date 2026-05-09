; DESCRIPTION: Places a red line segment connecting (140, 195) to (454, 210).
; PLAN: r0=140(x1), r1=195(y1), r2=454(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 195
LDI r2, 454
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
