; DESCRIPTION: Renders a green box of size 29x76 starting at (368, 137).
; PLAN: r0=368(x), r1=137(y), r2=29(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 137
LDI r2, 29
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
