; DESCRIPTION: Renders a black box of size 87x74 starting at (157, 143).
; PLAN: r0=157(x), r1=143(y), r2=87(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 143
LDI r2, 87
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
