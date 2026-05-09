; DESCRIPTION: Renders a cyan box of size 84x92 starting at (26, 56).
; PLAN: r0=26(x), r1=56(y), r2=84(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 56
LDI r2, 84
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
