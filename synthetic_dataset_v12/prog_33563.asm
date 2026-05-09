; DESCRIPTION: Draws a red rectangle at (275, 161) with width 76 and height 30.
; PLAN: r0=275(x), r1=161(y), r2=76(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 161
LDI r2, 76
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
