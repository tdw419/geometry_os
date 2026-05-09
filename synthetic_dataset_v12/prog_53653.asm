; DESCRIPTION: Draws a cyan line from (364, 15) to (472, 60).
; PLAN: r0=364(x1), r1=15(y1), r2=472(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 15
LDI r2, 472
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
