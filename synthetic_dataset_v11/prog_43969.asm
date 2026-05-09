; DESCRIPTION: Renders a black box of size 103x82 starting at (109, 167).
; PLAN: r0=109(x), r1=167(y), r2=103(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 167
LDI r2, 103
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
