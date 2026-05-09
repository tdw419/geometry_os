; DESCRIPTION: Places a white line segment connecting (175, 39) to (42, 156).
; PLAN: r0=175(x1), r1=39(y1), r2=42(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 39
LDI r2, 42
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
