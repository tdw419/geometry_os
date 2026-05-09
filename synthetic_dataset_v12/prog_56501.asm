; DESCRIPTION: Renders a cyan box of size 114x76 starting at (143, 102).
; PLAN: r0=143(x), r1=102(y), r2=114(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 102
LDI r2, 114
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
