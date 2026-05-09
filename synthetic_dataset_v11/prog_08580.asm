; DESCRIPTION: Renders a white box of size 59x84 starting at (187, 11).
; PLAN: r0=187(x), r1=11(y), r2=59(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 11
LDI r2, 59
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
