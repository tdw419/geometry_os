; DESCRIPTION: Renders a green box of size 34x43 starting at (184, 192).
; PLAN: r0=184(x), r1=192(y), r2=34(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 192
LDI r2, 34
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
