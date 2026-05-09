; DESCRIPTION: Places a cyan line segment connecting (73, 253) to (105, 224).
; PLAN: r0=73(x1), r1=253(y1), r2=105(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 253
LDI r2, 105
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
