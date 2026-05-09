; DESCRIPTION: Draws a red rectangle at (387, 173) with width 107 and height 21.
; PLAN: r0=387(x), r1=173(y), r2=107(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 173
LDI r2, 107
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
