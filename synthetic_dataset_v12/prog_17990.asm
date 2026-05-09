; DESCRIPTION: Renders a orange box of size 21x27 starting at (453, 114).
; PLAN: r0=453(x), r1=114(y), r2=21(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 114
LDI r2, 21
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
