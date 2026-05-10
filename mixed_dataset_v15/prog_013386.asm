; DESCRIPTION: Renders a yellow box of size 108x40 starting at (362, 199).
; PLAN: r0=362(x), r1=199(y), r2=108(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 199
LDI r2, 108
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
