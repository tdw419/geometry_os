; DESCRIPTION: Draws a cyan line from (121, 175) to (511, 138).
; PLAN: r0=121(x1), r1=175(y1), r2=511(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 175
LDI r2, 511
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
