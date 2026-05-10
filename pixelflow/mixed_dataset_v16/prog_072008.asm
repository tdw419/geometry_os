; DESCRIPTION: Renders a white box of size 50x22 starting at (454, 55).
; PLAN: r0=454(x), r1=55(y), r2=50(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 55
LDI r2, 50
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
