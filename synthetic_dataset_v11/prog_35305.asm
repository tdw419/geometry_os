; DESCRIPTION: Renders a cyan box of size 111x100 starting at (79, 151).
; PLAN: r0=79(x), r1=151(y), r2=111(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 151
LDI r2, 111
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
