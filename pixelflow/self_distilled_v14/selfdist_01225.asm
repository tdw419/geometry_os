; DESCRIPTION: Renders a yellow rectangular region spanning 40 by 45 at (396, 16).
; PLAN: r0=396(x), r1=16(y), r2=40(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 16
LDI r2, 40
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
