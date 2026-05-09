; DESCRIPTION: Draws a cyan line from (72, 170) to (29, 38).
; PLAN: r0=72(x1), r1=170(y1), r2=29(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 170
LDI r2, 29
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
