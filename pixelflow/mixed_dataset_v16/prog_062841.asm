; DESCRIPTION: Draws a blue rectangle at (403, 33) with width 57 and height 102.
; PLAN: r0=403(x), r1=33(y), r2=57(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 33
LDI r2, 57
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
