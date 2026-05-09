; DESCRIPTION: Draws a cyan line from (71, 170) to (219, 71).
; PLAN: r0=71(x1), r1=170(y1), r2=219(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 170
LDI r2, 219
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
