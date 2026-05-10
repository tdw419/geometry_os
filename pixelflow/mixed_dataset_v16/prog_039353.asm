; DESCRIPTION: Renders a cyan box of size 13x96 starting at (375, 43).
; PLAN: r0=375(x), r1=43(y), r2=13(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 43
LDI r2, 13
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
