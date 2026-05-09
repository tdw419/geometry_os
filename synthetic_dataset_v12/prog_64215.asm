; DESCRIPTION: Draws a green rectangle at (305, 31) with width 120 and height 54.
; PLAN: r0=305(x), r1=31(y), r2=120(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 31
LDI r2, 120
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
