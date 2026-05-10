; DESCRIPTION: Draws a red rectangle at (199, 0) with width 33 and height 42.
; PLAN: r0=199(x), r1=0(y), r2=33(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 0
LDI r2, 33
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
