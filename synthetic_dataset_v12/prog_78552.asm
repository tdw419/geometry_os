; DESCRIPTION: Draws a white line from (170, 172) to (154, 14).
; PLAN: r0=170(x1), r1=172(y1), r2=154(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 172
LDI r2, 154
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
