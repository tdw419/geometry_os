; DESCRIPTION: Renders a yellow rectangular region spanning 19 by 94 at (284, 51).
; PLAN: r0=284(x), r1=51(y), r2=19(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 51
LDI r2, 19
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
