; DESCRIPTION: Places a cyan line segment connecting (450, 222) to (181, 66).
; PLAN: r0=450(x1), r1=222(y1), r2=181(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 222
LDI r2, 181
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
