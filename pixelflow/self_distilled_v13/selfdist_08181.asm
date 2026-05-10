; DESCRIPTION: Draws a white rectangle at (398, 193) with width 82 and height 30.
; PLAN: r0=398(x), r1=193(y), r2=82(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 193
LDI r2, 82
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
