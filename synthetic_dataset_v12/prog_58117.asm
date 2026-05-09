; DESCRIPTION: Draws a white rectangle at (328, 107) with width 76 and height 112.
; PLAN: r0=328(x), r1=107(y), r2=76(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 107
LDI r2, 76
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
