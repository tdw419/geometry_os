; DESCRIPTION: Renders a black box of size 28x37 starting at (169, 214).
; PLAN: r0=169(x), r1=214(y), r2=28(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 214
LDI r2, 28
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
