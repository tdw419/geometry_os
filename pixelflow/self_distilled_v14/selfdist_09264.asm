; DESCRIPTION: Draws a green line from (346, 76) to (129, 142).
; PLAN: r0=346(x1), r1=76(y1), r2=129(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 76
LDI r2, 129
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
