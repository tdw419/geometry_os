; DESCRIPTION: Draws a blue rectangle at (284, 131) with width 82 and height 112.
; PLAN: r0=284(x), r1=131(y), r2=82(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 131
LDI r2, 82
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
