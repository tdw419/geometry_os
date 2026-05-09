; DESCRIPTION: Draws a cyan line from (24, 43) to (185, 167).
; PLAN: r0=24(x1), r1=43(y1), r2=185(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 43
LDI r2, 185
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
