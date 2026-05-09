; DESCRIPTION: Draws a white line from (80, 42) to (144, 102).
; PLAN: r0=80(x1), r1=42(y1), r2=144(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 42
LDI r2, 144
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
