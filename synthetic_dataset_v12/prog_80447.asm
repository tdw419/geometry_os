; DESCRIPTION: Places a cyan line segment connecting (8, 101) to (305, 138).
; PLAN: r0=8(x1), r1=101(y1), r2=305(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 101
LDI r2, 305
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
