; DESCRIPTION: Draws a red rectangle at (92, 91) with width 103 and height 87.
; PLAN: r0=92(x), r1=91(y), r2=103(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 91
LDI r2, 103
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
