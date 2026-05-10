; DESCRIPTION: Renders a blue box of size 34x52 starting at (154, 55).
; PLAN: r0=154(x), r1=55(y), r2=34(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 55
LDI r2, 34
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
