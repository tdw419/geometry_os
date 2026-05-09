; DESCRIPTION: Draws a green line from (228, 34) to (234, 99).
; PLAN: r0=228(x1), r1=34(y1), r2=234(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 34
LDI r2, 234
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
