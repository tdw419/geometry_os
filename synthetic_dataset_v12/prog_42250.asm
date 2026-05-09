; DESCRIPTION: Draws a green line from (32, 204) to (301, 41).
; PLAN: r0=32(x1), r1=204(y1), r2=301(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 204
LDI r2, 301
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
