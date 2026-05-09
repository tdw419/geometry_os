; DESCRIPTION: Draws a white rectangle at (168, 27) with width 60 and height 36.
; PLAN: r0=168(x), r1=27(y), r2=60(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 27
LDI r2, 60
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
