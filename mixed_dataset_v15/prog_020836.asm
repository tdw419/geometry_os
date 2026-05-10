; DESCRIPTION: Draws a white rectangle at (223, 129) with width 36 and height 74.
; PLAN: r0=223(x), r1=129(y), r2=36(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 129
LDI r2, 36
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
