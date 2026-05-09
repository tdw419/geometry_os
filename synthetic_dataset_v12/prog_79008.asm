; DESCRIPTION: Places a cyan line segment connecting (79, 209) to (423, 194).
; PLAN: r0=79(x1), r1=209(y1), r2=423(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 209
LDI r2, 423
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
