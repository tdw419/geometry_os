; DESCRIPTION: Draws a red rectangle at (284, 21) with width 72 and height 56.
; PLAN: r0=284(x), r1=21(y), r2=72(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 21
LDI r2, 72
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
