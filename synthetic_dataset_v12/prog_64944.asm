; DESCRIPTION: Renders a cyan box of size 22x75 starting at (358, 116).
; PLAN: r0=358(x), r1=116(y), r2=22(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 116
LDI r2, 22
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
