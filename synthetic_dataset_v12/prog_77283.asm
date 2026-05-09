; DESCRIPTION: Draws a white line from (304, 187) to (29, 222).
; PLAN: r0=304(x1), r1=187(y1), r2=29(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 187
LDI r2, 29
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
