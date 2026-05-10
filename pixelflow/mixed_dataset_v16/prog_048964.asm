; DESCRIPTION: Places a cyan line segment connecting (50, 95) to (35, 194).
; PLAN: r0=50(x1), r1=95(y1), r2=35(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 95
LDI r2, 35
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
