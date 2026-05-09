; DESCRIPTION: Places a white line segment connecting (295, 50) to (324, 159).
; PLAN: r0=295(x1), r1=50(y1), r2=324(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 50
LDI r2, 324
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
