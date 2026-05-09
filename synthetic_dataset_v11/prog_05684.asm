; DESCRIPTION: Renders a cyan box of size 62x26 starting at (122, 113).
; PLAN: r0=122(x), r1=113(y), r2=62(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 113
LDI r2, 62
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
