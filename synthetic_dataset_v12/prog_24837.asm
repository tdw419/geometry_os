; DESCRIPTION: Draws a purple rectangle at (403, 171) with width 45 and height 82.
; PLAN: r0=403(x), r1=171(y), r2=45(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 171
LDI r2, 45
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
