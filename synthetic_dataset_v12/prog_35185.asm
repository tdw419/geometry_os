; DESCRIPTION: Draws a white rectangle at (214, 74) with width 68 and height 82.
; PLAN: r0=214(x), r1=74(y), r2=68(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 74
LDI r2, 68
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
