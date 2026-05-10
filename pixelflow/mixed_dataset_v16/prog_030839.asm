; DESCRIPTION: Draws a red rectangle at (368, 150) with width 92 and height 24.
; PLAN: r0=368(x), r1=150(y), r2=92(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 150
LDI r2, 92
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
