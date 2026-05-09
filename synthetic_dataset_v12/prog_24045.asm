; DESCRIPTION: Renders a black box of size 19x42 starting at (266, 38).
; PLAN: r0=266(x), r1=38(y), r2=19(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 38
LDI r2, 19
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
