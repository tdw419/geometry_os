; DESCRIPTION: Draws a white line from (192, 109) to (121, 182).
; PLAN: r0=192(x1), r1=109(y1), r2=121(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 109
LDI r2, 121
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
