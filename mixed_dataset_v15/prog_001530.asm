; DESCRIPTION: Draws a white line from (405, 156) to (152, 31).
; PLAN: r0=405(x1), r1=156(y1), r2=152(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 156
LDI r2, 152
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
