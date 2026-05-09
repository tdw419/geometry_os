; DESCRIPTION: Draws a white rectangle at (178, 214) with width 49 and height 27.
; PLAN: r0=178(x), r1=214(y), r2=49(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 214
LDI r2, 49
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
