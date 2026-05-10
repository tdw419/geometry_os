; DESCRIPTION: Places a cyan line segment connecting (185, 70) to (180, 236).
; PLAN: r0=185(x1), r1=70(y1), r2=180(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 70
LDI r2, 180
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
