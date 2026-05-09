; DESCRIPTION: Draws a white rectangle at (295, 38) with width 86 and height 77.
; PLAN: r0=295(x), r1=38(y), r2=86(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 38
LDI r2, 86
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
