; DESCRIPTION: Draws a blue rectangle at (218, 149) with width 116 and height 32.
; PLAN: r0=218(x), r1=149(y), r2=116(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 149
LDI r2, 116
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
