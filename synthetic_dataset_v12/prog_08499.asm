; DESCRIPTION: Renders a green box of size 36x46 starting at (137, 64).
; PLAN: r0=137(x), r1=64(y), r2=36(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 64
LDI r2, 36
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
