; DESCRIPTION: Renders a black box of size 84x120 starting at (212, 44).
; PLAN: r0=212(x), r1=44(y), r2=84(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 44
LDI r2, 84
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
