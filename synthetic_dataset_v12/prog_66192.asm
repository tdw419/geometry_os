; DESCRIPTION: Draws a white rectangle at (470, 171) with width 32 and height 59.
; PLAN: r0=470(x), r1=171(y), r2=32(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 171
LDI r2, 32
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
