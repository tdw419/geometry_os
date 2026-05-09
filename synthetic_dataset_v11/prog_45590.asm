; DESCRIPTION: Renders a green box of size 28x76 starting at (154, 43).
; PLAN: r0=154(x), r1=43(y), r2=28(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 43
LDI r2, 28
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
