; DESCRIPTION: Renders a cyan box of size 84x71 starting at (72, 163).
; PLAN: r0=72(x), r1=163(y), r2=84(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 163
LDI r2, 84
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
