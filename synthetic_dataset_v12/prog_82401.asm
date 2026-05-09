; DESCRIPTION: Places a red line segment connecting (380, 27) to (110, 70).
; PLAN: r0=380(x1), r1=27(y1), r2=110(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 27
LDI r2, 110
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
