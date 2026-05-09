; DESCRIPTION: Places a cyan line segment connecting (50, 15) to (285, 20).
; PLAN: r0=50(x1), r1=15(y1), r2=285(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 15
LDI r2, 285
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
