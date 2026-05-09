; DESCRIPTION: Renders a green box of size 19x31 starting at (43, 192).
; PLAN: r0=43(x), r1=192(y), r2=19(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 192
LDI r2, 19
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
