; DESCRIPTION: Renders a red rectangular region spanning 38 by 16 at (188, 123).
; PLAN: r0=188(x), r1=123(y), r2=38(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 123
LDI r2, 38
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
