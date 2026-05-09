; DESCRIPTION: Draws a white line from (52, 221) to (144, 108).
; PLAN: r0=52(x1), r1=221(y1), r2=144(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 221
LDI r2, 144
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
