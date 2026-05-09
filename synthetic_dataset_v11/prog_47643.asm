; DESCRIPTION: Renders a white box of size 24x65 starting at (85, 84).
; PLAN: r0=85(x), r1=84(y), r2=24(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 84
LDI r2, 24
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
