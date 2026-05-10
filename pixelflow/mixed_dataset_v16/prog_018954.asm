; DESCRIPTION: Places a white line segment connecting (156, 209) to (510, 161).
; PLAN: r0=156(x1), r1=209(y1), r2=510(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 209
LDI r2, 510
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
