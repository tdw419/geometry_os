; DESCRIPTION: Renders a black box of size 39x70 starting at (215, 29).
; PLAN: r0=215(x), r1=29(y), r2=39(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 29
LDI r2, 39
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
