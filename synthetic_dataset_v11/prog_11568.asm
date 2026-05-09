; DESCRIPTION: Renders a red box of size 75x120 starting at (176, 87).
; PLAN: r0=176(x), r1=87(y), r2=75(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 87
LDI r2, 75
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
