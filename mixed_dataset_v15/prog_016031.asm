; DESCRIPTION: Renders a black box of size 25x64 starting at (82, 172).
; PLAN: r0=82(x), r1=172(y), r2=25(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 172
LDI r2, 25
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
