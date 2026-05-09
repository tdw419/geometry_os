; DESCRIPTION: Places a cyan line segment connecting (450, 236) to (10, 26).
; PLAN: r0=450(x1), r1=236(y1), r2=10(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 236
LDI r2, 10
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
