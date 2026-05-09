; DESCRIPTION: Places a magenta 34x113 rectangle at position (320, 122).
; PLAN: r0=320(x), r1=122(y), r2=34(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 122
LDI r2, 34
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
