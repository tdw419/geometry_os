; DESCRIPTION: Draws a white line from (39, 207) to (121, 192).
; PLAN: r0=39(x1), r1=207(y1), r2=121(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 207
LDI r2, 121
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
