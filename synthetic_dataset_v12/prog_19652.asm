; DESCRIPTION: Renders a green box of size 28x19 starting at (76, 209).
; PLAN: r0=76(x), r1=209(y), r2=28(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 209
LDI r2, 28
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
