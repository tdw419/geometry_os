; DESCRIPTION: Renders a white box of size 65x69 starting at (150, 135).
; PLAN: r0=150(x), r1=135(y), r2=65(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 135
LDI r2, 65
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
