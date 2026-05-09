; DESCRIPTION: Draws a red rectangle at (284, 153) with width 69 and height 98.
; PLAN: r0=284(x), r1=153(y), r2=69(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 153
LDI r2, 69
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
