; DESCRIPTION: Places a cyan line segment connecting (455, 126) to (442, 139).
; PLAN: r0=455(x1), r1=126(y1), r2=442(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 126
LDI r2, 442
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
