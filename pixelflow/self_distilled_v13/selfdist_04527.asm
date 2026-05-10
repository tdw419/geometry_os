; DESCRIPTION: Renders a red rectangular region spanning 70 by 20 at (232, 113).
; PLAN: r0=232(x), r1=113(y), r2=70(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 113
LDI r2, 70
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
