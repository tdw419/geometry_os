; DESCRIPTION: Renders a black box of size 56x12 starting at (56, 187).
; PLAN: r0=56(x), r1=187(y), r2=56(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 187
LDI r2, 56
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
