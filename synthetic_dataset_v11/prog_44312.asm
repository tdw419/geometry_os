; DESCRIPTION: Renders a green box of size 44x14 starting at (189, 179).
; PLAN: r0=189(x), r1=179(y), r2=44(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 179
LDI r2, 44
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
