; DESCRIPTION: Places a red line segment connecting (392, 75) to (298, 79).
; PLAN: r0=392(x1), r1=75(y1), r2=298(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 75
LDI r2, 298
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
