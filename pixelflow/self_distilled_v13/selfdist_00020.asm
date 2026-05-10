; DESCRIPTION: Renders a blue rectangular region spanning 57 by 105 at (380, 8).
; PLAN: r0=380(x), r1=8(y), r2=57(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 8
LDI r2, 57
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
