; DESCRIPTION: Places a green line segment connecting (405, 178) to (442, 48).
; PLAN: r0=405(x1), r1=178(y1), r2=442(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 178
LDI r2, 442
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
