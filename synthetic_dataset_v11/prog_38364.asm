; DESCRIPTION: Draws a cyan line from (153, 43) to (194, 255).
; PLAN: r0=153(x1), r1=43(y1), r2=194(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 43
LDI r2, 194
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
