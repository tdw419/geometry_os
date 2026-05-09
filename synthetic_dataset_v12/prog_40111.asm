; DESCRIPTION: Draws a cyan line from (364, 140) to (305, 230).
; PLAN: r0=364(x1), r1=140(y1), r2=305(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 140
LDI r2, 305
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
