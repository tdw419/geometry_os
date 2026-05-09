; DESCRIPTION: Renders a cyan box of size 11x39 starting at (289, 151).
; PLAN: r0=289(x), r1=151(y), r2=11(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 151
LDI r2, 11
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
