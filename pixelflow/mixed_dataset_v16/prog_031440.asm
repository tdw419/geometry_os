; DESCRIPTION: Draws a red rectangle at (433, 176) with width 73 and height 24.
; PLAN: r0=433(x), r1=176(y), r2=73(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 176
LDI r2, 73
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
