; DESCRIPTION: Draws a white rectangle at (146, 3) with width 38 and height 44.
; PLAN: r0=146(x), r1=3(y), r2=38(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 3
LDI r2, 38
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
