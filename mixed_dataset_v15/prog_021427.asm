; DESCRIPTION: Places a cyan line segment connecting (216, 126) to (499, 65).
; PLAN: r0=216(x1), r1=126(y1), r2=499(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 126
LDI r2, 499
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
