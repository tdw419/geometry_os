; DESCRIPTION: Draws a cyan line from (472, 0) to (231, 0).
; PLAN: r0=472(x1), r1=0(y1), r2=231(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 0
LDI r2, 231
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
