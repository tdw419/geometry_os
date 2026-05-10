; DESCRIPTION: Renders a yellow box of size 49x57 starting at (215, 107).
; PLAN: r0=215(x), r1=107(y), r2=49(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 107
LDI r2, 49
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
