; DESCRIPTION: Draws a white rectangle at (243, 177) with width 95 and height 79.
; PLAN: r0=243(x), r1=177(y), r2=95(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 177
LDI r2, 95
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
