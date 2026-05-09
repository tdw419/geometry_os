; DESCRIPTION: Draws a white line from (445, 218) to (205, 38).
; PLAN: r0=445(x1), r1=218(y1), r2=205(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 218
LDI r2, 205
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
