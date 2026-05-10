; DESCRIPTION: Renders a red box of size 35x30 starting at (117, 103).
; PLAN: r0=117(x), r1=103(y), r2=35(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 103
LDI r2, 35
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
