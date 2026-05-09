; DESCRIPTION: Places a orange line segment connecting (344, 47) to (488, 5).
; PLAN: r0=344(x1), r1=47(y1), r2=488(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 47
LDI r2, 488
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
