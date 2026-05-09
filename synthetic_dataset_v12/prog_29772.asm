; DESCRIPTION: Draws a white rectangle at (294, 120) with width 28 and height 102.
; PLAN: r0=294(x), r1=120(y), r2=28(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 120
LDI r2, 28
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
