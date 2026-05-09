; DESCRIPTION: Places a green line segment connecting (467, 242) to (455, 88).
; PLAN: r0=467(x1), r1=242(y1), r2=455(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 242
LDI r2, 455
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
