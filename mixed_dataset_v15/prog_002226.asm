; DESCRIPTION: Renders a white box of size 56x102 starting at (304, 123).
; PLAN: r0=304(x), r1=123(y), r2=56(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 123
LDI r2, 56
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
