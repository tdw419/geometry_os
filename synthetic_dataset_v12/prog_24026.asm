; DESCRIPTION: Renders a cyan box of size 84x92 starting at (427, 16).
; PLAN: r0=427(x), r1=16(y), r2=84(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 16
LDI r2, 84
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
