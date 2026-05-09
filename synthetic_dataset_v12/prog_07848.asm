; DESCRIPTION: Renders a cyan box of size 26x49 starting at (247, 98).
; PLAN: r0=247(x), r1=98(y), r2=26(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 98
LDI r2, 26
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
