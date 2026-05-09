; DESCRIPTION: Draws a blue rectangle at (415, 215) with width 58 and height 32.
; PLAN: r0=415(x), r1=215(y), r2=58(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 215
LDI r2, 58
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
