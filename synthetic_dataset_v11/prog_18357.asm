; DESCRIPTION: Renders a white box of size 111x62 starting at (135, 4).
; PLAN: r0=135(x), r1=4(y), r2=111(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 4
LDI r2, 111
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
