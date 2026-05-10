; DESCRIPTION: Draws a green line from (191, 72) to (380, 142).
; PLAN: r0=191(x1), r1=72(y1), r2=380(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 72
LDI r2, 380
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
