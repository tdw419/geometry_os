; DESCRIPTION: Places a red line segment connecting (295, 50) to (305, 15).
; PLAN: r0=295(x1), r1=50(y1), r2=305(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 50
LDI r2, 305
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
