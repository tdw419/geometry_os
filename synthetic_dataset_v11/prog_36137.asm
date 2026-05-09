; DESCRIPTION: Renders a cyan box of size 83x15 starting at (156, 102).
; PLAN: r0=156(x), r1=102(y), r2=83(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 102
LDI r2, 83
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
