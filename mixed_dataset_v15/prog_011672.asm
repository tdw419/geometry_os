; DESCRIPTION: Renders a cyan box of size 43x24 starting at (7, 203).
; PLAN: r0=7(x), r1=203(y), r2=43(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 203
LDI r2, 43
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
