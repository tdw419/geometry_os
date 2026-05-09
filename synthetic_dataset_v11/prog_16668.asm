; DESCRIPTION: Renders a cyan box of size 78x11 starting at (30, 102).
; PLAN: r0=30(x), r1=102(y), r2=78(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 102
LDI r2, 78
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
