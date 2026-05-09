; DESCRIPTION: Places a green line segment connecting (27, 104) to (293, 27).
; PLAN: r0=27(x1), r1=104(y1), r2=293(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 104
LDI r2, 293
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
