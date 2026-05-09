; DESCRIPTION: Renders a yellow box of size 76x82 starting at (327, 101).
; PLAN: r0=327(x), r1=101(y), r2=76(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 101
LDI r2, 76
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
