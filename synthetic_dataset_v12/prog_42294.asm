; DESCRIPTION: Renders a cyan box of size 114x39 starting at (11, 155).
; PLAN: r0=11(x), r1=155(y), r2=114(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 155
LDI r2, 114
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
