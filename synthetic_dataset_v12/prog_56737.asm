; DESCRIPTION: Draws a red rectangle at (372, 71) with width 117 and height 120.
; PLAN: r0=372(x), r1=71(y), r2=117(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 71
LDI r2, 117
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
