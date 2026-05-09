; DESCRIPTION: Places a cyan line segment connecting (274, 242) to (101, 5).
; PLAN: r0=274(x1), r1=242(y1), r2=101(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 242
LDI r2, 101
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
