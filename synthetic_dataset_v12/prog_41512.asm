; DESCRIPTION: Renders a cyan box of size 86x102 starting at (119, 100).
; PLAN: r0=119(x), r1=100(y), r2=86(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 100
LDI r2, 86
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
