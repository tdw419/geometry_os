; DESCRIPTION: Renders a red box of size 72x117 starting at (113, 61).
; PLAN: r0=113(x), r1=61(y), r2=72(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 61
LDI r2, 72
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
