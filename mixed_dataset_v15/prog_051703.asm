; DESCRIPTION: Renders a blue box of size 78x95 starting at (224, 55).
; PLAN: r0=224(x), r1=55(y), r2=78(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 55
LDI r2, 78
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
