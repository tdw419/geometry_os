; DESCRIPTION: Draws a red rectangle at (398, 164) with width 66 and height 66.
; PLAN: r0=398(x), r1=164(y), r2=66(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 164
LDI r2, 66
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
