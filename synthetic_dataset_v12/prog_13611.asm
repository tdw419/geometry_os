; DESCRIPTION: Renders a cyan box of size 39x84 starting at (28, 96).
; PLAN: r0=28(x), r1=96(y), r2=39(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 96
LDI r2, 39
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
