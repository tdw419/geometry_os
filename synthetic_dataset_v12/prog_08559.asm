; DESCRIPTION: Places a white line segment connecting (52, 102) to (42, 166).
; PLAN: r0=52(x1), r1=102(y1), r2=42(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 102
LDI r2, 42
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
