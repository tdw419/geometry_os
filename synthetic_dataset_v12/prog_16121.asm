; DESCRIPTION: Renders a cyan box of size 74x43 starting at (203, 47).
; PLAN: r0=203(x), r1=47(y), r2=74(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 47
LDI r2, 74
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
