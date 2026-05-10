; DESCRIPTION: Renders a yellow rectangular region spanning 20 by 22 at (38, 192).
; PLAN: r0=38(x), r1=192(y), r2=20(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 192
LDI r2, 20
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
