; DESCRIPTION: Renders a black line between points (116, 233) and (469, 231).
; PLAN: r0=116(x1), r1=233(y1), r2=469(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 233
LDI r2, 469
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
