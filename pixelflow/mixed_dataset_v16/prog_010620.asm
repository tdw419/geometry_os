; DESCRIPTION: Renders a cyan box of size 14x102 starting at (157, 15).
; PLAN: r0=157(x), r1=15(y), r2=14(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 15
LDI r2, 14
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
