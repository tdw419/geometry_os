; DESCRIPTION: Renders a white box of size 69x39 starting at (260, 77).
; PLAN: r0=260(x), r1=77(y), r2=69(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 77
LDI r2, 69
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
