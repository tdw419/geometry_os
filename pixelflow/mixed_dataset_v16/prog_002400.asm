; DESCRIPTION: Draws a red rectangle at (304, 143) with width 76 and height 16.
; PLAN: r0=304(x), r1=143(y), r2=76(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 143
LDI r2, 76
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
