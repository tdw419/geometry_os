; DESCRIPTION: Renders a cyan box of size 74x64 starting at (8, 15).
; PLAN: r0=8(x), r1=15(y), r2=74(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 15
LDI r2, 74
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
