; DESCRIPTION: Places a cyan line segment connecting (214, 101) to (337, 12).
; PLAN: r0=214(x1), r1=101(y1), r2=337(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 101
LDI r2, 337
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
