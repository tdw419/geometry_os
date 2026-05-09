; DESCRIPTION: Renders a cyan box of size 64x40 starting at (157, 155).
; PLAN: r0=157(x), r1=155(y), r2=64(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 155
LDI r2, 64
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
