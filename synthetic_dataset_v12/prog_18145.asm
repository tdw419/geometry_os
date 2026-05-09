; DESCRIPTION: Renders a red box of size 79x49 starting at (402, 197).
; PLAN: r0=402(x), r1=197(y), r2=79(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 197
LDI r2, 79
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
