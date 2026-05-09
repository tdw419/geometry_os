; DESCRIPTION: Renders a green box of size 41x102 starting at (124, 56).
; PLAN: r0=124(x), r1=56(y), r2=41(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 56
LDI r2, 41
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
