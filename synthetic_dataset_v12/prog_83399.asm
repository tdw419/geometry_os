; DESCRIPTION: Draws a green line from (357, 204) to (406, 61).
; PLAN: r0=357(x1), r1=204(y1), r2=406(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 204
LDI r2, 406
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
