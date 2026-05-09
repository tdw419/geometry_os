; DESCRIPTION: Places a white line segment connecting (367, 240) to (156, 164).
; PLAN: r0=367(x1), r1=240(y1), r2=156(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 240
LDI r2, 156
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
