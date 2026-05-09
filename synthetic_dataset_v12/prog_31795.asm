; DESCRIPTION: Draws a red rectangle at (150, 180) with width 70 and height 52.
; PLAN: r0=150(x), r1=180(y), r2=70(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 180
LDI r2, 70
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
