; DESCRIPTION: Renders a yellow rectangular region spanning 46 by 48 at (222, 16).
; PLAN: r0=222(x), r1=16(y), r2=46(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 16
LDI r2, 46
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
