; DESCRIPTION: Places a black line segment connecting (298, 133) to (21, 31).
; PLAN: r0=298(x1), r1=133(y1), r2=21(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 133
LDI r2, 21
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
