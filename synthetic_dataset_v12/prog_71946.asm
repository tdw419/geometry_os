; DESCRIPTION: Draws a red rectangle at (87, 58) with width 116 and height 120.
; PLAN: r0=87(x), r1=58(y), r2=116(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 58
LDI r2, 116
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
