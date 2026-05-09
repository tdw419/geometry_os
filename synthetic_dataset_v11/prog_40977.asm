; DESCRIPTION: Places a cyan line segment connecting (42, 224) to (129, 182).
; PLAN: r0=42(x1), r1=224(y1), r2=129(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 224
LDI r2, 129
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
