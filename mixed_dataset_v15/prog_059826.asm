; DESCRIPTION: Draws a cyan line from (159, 138) to (17, 192).
; PLAN: r0=159(x1), r1=138(y1), r2=17(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 138
LDI r2, 17
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
