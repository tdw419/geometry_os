; DESCRIPTION: Draws a red rectangle at (73, 128) with width 61 and height 72.
; PLAN: r0=73(x), r1=128(y), r2=61(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 128
LDI r2, 61
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
