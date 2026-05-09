; DESCRIPTION: Renders a white box of size 43x45 starting at (435, 55).
; PLAN: r0=435(x), r1=55(y), r2=43(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 55
LDI r2, 43
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
