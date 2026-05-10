; DESCRIPTION: Draws a white rectangle at (345, 48) with width 24 and height 95.
; PLAN: r0=345(x), r1=48(y), r2=24(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 48
LDI r2, 24
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
