; DESCRIPTION: Draws a green rectangle at (403, 13) with width 109 and height 113.
; PLAN: r0=403(x), r1=13(y), r2=109(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 13
LDI r2, 109
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
