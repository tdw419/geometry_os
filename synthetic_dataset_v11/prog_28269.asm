; DESCRIPTION: Renders a black box of size 76x87 starting at (174, 153).
; PLAN: r0=174(x), r1=153(y), r2=76(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 153
LDI r2, 76
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
