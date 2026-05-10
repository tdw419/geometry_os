; DESCRIPTION: Renders a cyan box of size 73x84 starting at (96, 122).
; PLAN: r0=96(x), r1=122(y), r2=73(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 122
LDI r2, 73
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
