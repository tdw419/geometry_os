; DESCRIPTION: Renders a cyan box of size 10x64 starting at (222, 151).
; PLAN: r0=222(x), r1=151(y), r2=10(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 151
LDI r2, 10
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
