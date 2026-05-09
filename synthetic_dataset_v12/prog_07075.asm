; DESCRIPTION: Draws a red rectangle at (171, 173) with width 26 and height 44.
; PLAN: r0=171(x), r1=173(y), r2=26(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 173
LDI r2, 26
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
