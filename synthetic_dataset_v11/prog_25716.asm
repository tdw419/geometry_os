; DESCRIPTION: Draws a cyan line from (28, 15) to (202, 147).
; PLAN: r0=28(x1), r1=15(y1), r2=202(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 15
LDI r2, 202
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
