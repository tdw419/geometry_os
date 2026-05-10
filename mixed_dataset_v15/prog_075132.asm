; DESCRIPTION: Places a cyan line segment connecting (233, 154) to (190, 234).
; PLAN: r0=233(x1), r1=154(y1), r2=190(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 154
LDI r2, 190
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
