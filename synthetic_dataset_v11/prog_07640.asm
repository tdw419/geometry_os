; DESCRIPTION: Renders a white box of size 86x23 starting at (169, 162).
; PLAN: r0=169(x), r1=162(y), r2=86(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 162
LDI r2, 86
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
