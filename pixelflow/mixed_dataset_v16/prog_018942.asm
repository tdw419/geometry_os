; DESCRIPTION: Renders a green rectangular region spanning 17 by 16 at (34, 103).
; PLAN: r0=34(x), r1=103(y), r2=17(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 103
LDI r2, 17
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
