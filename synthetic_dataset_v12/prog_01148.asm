; DESCRIPTION: Places a cyan line segment connecting (220, 215) to (226, 75).
; PLAN: r0=220(x1), r1=215(y1), r2=226(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 215
LDI r2, 226
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
