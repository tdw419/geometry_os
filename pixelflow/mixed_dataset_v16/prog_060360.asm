; DESCRIPTION: Draws a cyan line from (230, 170) to (25, 202).
; PLAN: r0=230(x1), r1=170(y1), r2=25(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 170
LDI r2, 25
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
