; DESCRIPTION: Places a white line segment connecting (183, 149) to (410, 97).
; PLAN: r0=183(x1), r1=149(y1), r2=410(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 149
LDI r2, 410
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
