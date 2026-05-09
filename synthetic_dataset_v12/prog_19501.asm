; DESCRIPTION: Places a black line segment connecting (295, 15) to (120, 166).
; PLAN: r0=295(x1), r1=15(y1), r2=120(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 15
LDI r2, 120
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
