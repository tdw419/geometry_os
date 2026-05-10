; DESCRIPTION: Renders a yellow rectangular region spanning 111 by 25 at (362, 188).
; PLAN: r0=362(x), r1=188(y), r2=111(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 188
LDI r2, 111
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
