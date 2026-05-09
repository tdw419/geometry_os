; DESCRIPTION: Draws a red rectangle at (351, 124) with width 82 and height 10.
; PLAN: r0=351(x), r1=124(y), r2=82(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 124
LDI r2, 82
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
