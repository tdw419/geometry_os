; DESCRIPTION: Places a cyan line segment connecting (193, 174) to (180, 203).
; PLAN: r0=193(x1), r1=174(y1), r2=180(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 174
LDI r2, 180
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
