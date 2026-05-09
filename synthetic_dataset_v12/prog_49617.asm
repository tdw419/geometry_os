; DESCRIPTION: Places a blue line segment connecting (52, 164) to (405, 166).
; PLAN: r0=52(x1), r1=164(y1), r2=405(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 164
LDI r2, 405
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
