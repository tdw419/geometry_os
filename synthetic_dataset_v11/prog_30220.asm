; DESCRIPTION: Draws a green line from (46, 248) to (53, 6).
; PLAN: r0=46(x1), r1=248(y1), r2=53(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 248
LDI r2, 53
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
