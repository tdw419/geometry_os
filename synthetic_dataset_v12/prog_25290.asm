; DESCRIPTION: Draws a red rectangle at (401, 58) with width 28 and height 90.
; PLAN: r0=401(x), r1=58(y), r2=28(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 58
LDI r2, 28
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
