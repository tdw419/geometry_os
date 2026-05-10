; DESCRIPTION: Draws a black rectangle at (214, 73) with width 107 and height 103.
; PLAN: r0=214(x), r1=73(y), r2=107(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 73
LDI r2, 107
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
