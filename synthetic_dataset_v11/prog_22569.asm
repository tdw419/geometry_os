; DESCRIPTION: Renders a cyan box of size 29x25 starting at (114, 222).
; PLAN: r0=114(x), r1=222(y), r2=29(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 222
LDI r2, 29
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
