; DESCRIPTION: Places a white line segment connecting (450, 13) to (295, 134).
; PLAN: r0=450(x1), r1=13(y1), r2=295(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 13
LDI r2, 295
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
