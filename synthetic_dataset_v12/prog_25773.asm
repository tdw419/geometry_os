; DESCRIPTION: Renders a cyan box of size 101x43 starting at (205, 153).
; PLAN: r0=205(x), r1=153(y), r2=101(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 153
LDI r2, 101
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
