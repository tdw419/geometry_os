; DESCRIPTION: Renders a black box of size 102x24 starting at (215, 215).
; PLAN: r0=215(x), r1=215(y), r2=102(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 215
LDI r2, 102
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
