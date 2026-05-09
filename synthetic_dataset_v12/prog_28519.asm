; DESCRIPTION: Renders a red box of size 79x69 starting at (391, 113).
; PLAN: r0=391(x), r1=113(y), r2=79(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 113
LDI r2, 79
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
