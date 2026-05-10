; DESCRIPTION: Renders a blue rectangular region spanning 107 by 107 at (255, 121).
; PLAN: r0=255(x), r1=121(y), r2=107(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 121
LDI r2, 107
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
