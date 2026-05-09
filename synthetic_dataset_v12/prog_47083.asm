; DESCRIPTION: Renders a cyan box of size 37x28 starting at (460, 151).
; PLAN: r0=460(x), r1=151(y), r2=37(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 151
LDI r2, 37
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
