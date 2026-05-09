; DESCRIPTION: Draws a white line from (59, 245) to (53, 97).
; PLAN: r0=59(x1), r1=245(y1), r2=53(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 245
LDI r2, 53
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
