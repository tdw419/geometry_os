; DESCRIPTION: Draws a white line from (129, 138) to (0, 111).
; PLAN: r0=129(x1), r1=138(y1), r2=0(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 138
LDI r2, 0
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
