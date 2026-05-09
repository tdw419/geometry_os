; DESCRIPTION: Renders a black box of size 73x73 starting at (146, 163).
; PLAN: r0=146(x), r1=163(y), r2=73(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 163
LDI r2, 73
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
