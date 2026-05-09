; DESCRIPTION: Places a black line segment connecting (121, 205) to (406, 28).
; PLAN: r0=121(x1), r1=205(y1), r2=406(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 205
LDI r2, 406
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
