; DESCRIPTION: Draws a white rectangle at (406, 167) with width 59 and height 64.
; PLAN: r0=406(x), r1=167(y), r2=59(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 167
LDI r2, 59
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
