; DESCRIPTION: Renders a black box of size 72x117 starting at (156, 64).
; PLAN: r0=156(x), r1=64(y), r2=72(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 64
LDI r2, 72
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
