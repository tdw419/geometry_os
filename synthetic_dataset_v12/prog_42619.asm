; DESCRIPTION: Draws a orange rectangle at (173, 131) with width 82 and height 48.
; PLAN: r0=173(x), r1=131(y), r2=82(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 131
LDI r2, 82
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
