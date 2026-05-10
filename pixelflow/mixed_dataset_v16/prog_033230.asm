; DESCRIPTION: Draws a red rectangle at (375, 82) with width 90 and height 103.
; PLAN: r0=375(x), r1=82(y), r2=90(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 82
LDI r2, 90
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
