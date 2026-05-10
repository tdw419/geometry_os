; DESCRIPTION: Renders a yellow rectangular region spanning 94 by 10 at (313, 107).
; PLAN: r0=313(x), r1=107(y), r2=94(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 107
LDI r2, 94
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
