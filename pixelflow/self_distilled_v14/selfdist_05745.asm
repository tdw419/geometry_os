; DESCRIPTION: Draws a red rectangle at (245, 109) with width 39 and height 79.
; PLAN: r0=245(x), r1=109(y), r2=39(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 109
LDI r2, 39
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
