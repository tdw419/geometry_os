; DESCRIPTION: Renders a cyan box of size 95x102 starting at (144, 88).
; PLAN: r0=144(x), r1=88(y), r2=95(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 88
LDI r2, 95
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
