; DESCRIPTION: Renders a yellow box of size 114x105 starting at (368, 82).
; PLAN: r0=368(x), r1=82(y), r2=114(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 82
LDI r2, 114
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
