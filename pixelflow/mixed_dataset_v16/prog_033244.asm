; DESCRIPTION: Draws a white rectangle at (305, 16) with width 115 and height 95.
; PLAN: r0=305(x), r1=16(y), r2=115(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 16
LDI r2, 115
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
