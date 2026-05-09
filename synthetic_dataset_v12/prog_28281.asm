; DESCRIPTION: Renders a white box of size 40x83 starting at (63, 135).
; PLAN: r0=63(x), r1=135(y), r2=40(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 135
LDI r2, 40
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
