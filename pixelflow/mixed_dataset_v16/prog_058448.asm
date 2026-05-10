; DESCRIPTION: Renders a black box of size 10x61 starting at (10, 143).
; PLAN: r0=10(x), r1=143(y), r2=10(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 143
LDI r2, 10
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
