; DESCRIPTION: Renders a cyan box of size 19x40 starting at (64, 68).
; PLAN: r0=64(x), r1=68(y), r2=19(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 68
LDI r2, 19
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
