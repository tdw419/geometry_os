; DESCRIPTION: Renders a white box of size 113x11 starting at (13, 182).
; PLAN: r0=13(x), r1=182(y), r2=113(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 182
LDI r2, 113
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
