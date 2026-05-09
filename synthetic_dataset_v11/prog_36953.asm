; DESCRIPTION: Renders a white box of size 15x84 starting at (130, 108).
; PLAN: r0=130(x), r1=108(y), r2=15(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 108
LDI r2, 15
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
