; DESCRIPTION: Places a white line segment connecting (74, 71) to (23, 111).
; PLAN: r0=74(x1), r1=71(y1), r2=23(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 71
LDI r2, 23
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
