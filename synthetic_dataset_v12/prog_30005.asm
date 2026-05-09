; DESCRIPTION: Renders a cyan box of size 81x70 starting at (94, 151).
; PLAN: r0=94(x), r1=151(y), r2=81(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 151
LDI r2, 81
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
