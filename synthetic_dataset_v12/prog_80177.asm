; DESCRIPTION: Renders a black box of size 71x28 starting at (290, 68).
; PLAN: r0=290(x), r1=68(y), r2=71(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 68
LDI r2, 71
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
