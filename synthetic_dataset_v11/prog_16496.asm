; DESCRIPTION: Renders a cyan box of size 49x32 starting at (148, 155).
; PLAN: r0=148(x), r1=155(y), r2=49(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 155
LDI r2, 49
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
