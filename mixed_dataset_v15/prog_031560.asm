; DESCRIPTION: Places a cyan line segment connecting (466, 70) to (270, 236).
; PLAN: r0=466(x1), r1=70(y1), r2=270(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 70
LDI r2, 270
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
