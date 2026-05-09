; DESCRIPTION: Draws a red rectangle at (393, 128) with width 102 and height 76.
; PLAN: r0=393(x), r1=128(y), r2=102(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 128
LDI r2, 102
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
