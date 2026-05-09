; DESCRIPTION: Draws a white rectangle at (299, 228) with width 91 and height 10.
; PLAN: r0=299(x), r1=228(y), r2=91(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 228
LDI r2, 91
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
