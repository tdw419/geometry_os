; DESCRIPTION: Places a cyan line segment connecting (126, 4) to (220, 242).
; PLAN: r0=126(x1), r1=4(y1), r2=220(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 4
LDI r2, 220
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
