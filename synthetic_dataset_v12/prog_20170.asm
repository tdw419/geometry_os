; DESCRIPTION: Renders a red box of size 95x37 starting at (402, 197).
; PLAN: r0=402(x), r1=197(y), r2=95(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 197
LDI r2, 95
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
