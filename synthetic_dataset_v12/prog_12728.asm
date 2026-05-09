; DESCRIPTION: Draws a green line from (477, 181) to (346, 28).
; PLAN: r0=477(x1), r1=181(y1), r2=346(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 181
LDI r2, 346
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
