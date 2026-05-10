; DESCRIPTION: Renders a white box of size 69x64 starting at (28, 162).
; PLAN: r0=28(x), r1=162(y), r2=69(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 162
LDI r2, 69
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
