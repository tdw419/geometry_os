; DESCRIPTION: Places a cyan line segment connecting (48, 213) to (126, 70).
; PLAN: r0=48(x1), r1=213(y1), r2=126(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 213
LDI r2, 126
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
