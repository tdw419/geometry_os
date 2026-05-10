; DESCRIPTION: Draws a white rectangle at (27, 23) with width 103 and height 64.
; PLAN: r0=27(x), r1=23(y), r2=103(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 23
LDI r2, 103
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
