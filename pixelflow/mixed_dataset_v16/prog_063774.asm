; DESCRIPTION: Renders a white box of size 111x105 starting at (137, 63).
; PLAN: r0=137(x), r1=63(y), r2=111(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 63
LDI r2, 111
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
