; DESCRIPTION: Renders a yellow rectangular region spanning 10 by 16 at (24, 39).
; PLAN: r0=24(x), r1=39(y), r2=10(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 39
LDI r2, 10
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
