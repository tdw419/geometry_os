; DESCRIPTION: Renders a white box of size 50x20 starting at (324, 55).
; PLAN: r0=324(x), r1=55(y), r2=50(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 55
LDI r2, 50
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
