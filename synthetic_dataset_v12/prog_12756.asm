; DESCRIPTION: Renders a cyan box of size 67x119 starting at (69, 2).
; PLAN: r0=69(x), r1=2(y), r2=67(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 2
LDI r2, 67
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
