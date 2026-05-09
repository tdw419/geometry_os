; DESCRIPTION: Places a cyan line segment connecting (175, 180) to (126, 24).
; PLAN: r0=175(x1), r1=180(y1), r2=126(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 180
LDI r2, 126
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
