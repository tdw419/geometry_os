; DESCRIPTION: Places a black line segment connecting (416, 28) to (276, 83).
; PLAN: r0=416(x1), r1=28(y1), r2=276(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 28
LDI r2, 276
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
