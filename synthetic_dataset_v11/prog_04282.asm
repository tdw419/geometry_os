; DESCRIPTION: Renders a white box of size 29x20 starting at (120, 46).
; PLAN: r0=120(x), r1=46(y), r2=29(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 46
LDI r2, 29
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
