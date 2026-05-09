; DESCRIPTION: Renders a blue box of size 72x98 starting at (268, 133).
; PLAN: r0=268(x), r1=133(y), r2=72(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 133
LDI r2, 72
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
