; DESCRIPTION: Places a cyan line segment connecting (73, 78) to (284, 224).
; PLAN: r0=73(x1), r1=78(y1), r2=284(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 78
LDI r2, 284
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
