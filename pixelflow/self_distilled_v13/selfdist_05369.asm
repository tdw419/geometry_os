; DESCRIPTION: Renders a cyan line segment connecting (268, 128) to (252, 199).
; PLAN: r0=268(x1), r1=128(y1), r2=252(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 128
LDI r2, 252
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
