; DESCRIPTION: Renders a white box of size 111x108 starting at (135, 110).
; PLAN: r0=135(x), r1=110(y), r2=111(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 110
LDI r2, 111
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
