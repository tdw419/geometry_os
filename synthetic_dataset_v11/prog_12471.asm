; DESCRIPTION: Draws a green line from (32, 221) to (31, 4).
; PLAN: r0=32(x1), r1=221(y1), r2=31(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 221
LDI r2, 31
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
