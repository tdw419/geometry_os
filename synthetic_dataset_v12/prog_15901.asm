; DESCRIPTION: Renders a cyan line between points (364, 234) and (230, 25).
; PLAN: r0=364(x1), r1=234(y1), r2=230(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 234
LDI r2, 230
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
