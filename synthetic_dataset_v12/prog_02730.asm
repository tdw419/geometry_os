; DESCRIPTION: Draws a green line from (371, 105) to (53, 61).
; PLAN: r0=371(x1), r1=105(y1), r2=53(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 105
LDI r2, 53
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
