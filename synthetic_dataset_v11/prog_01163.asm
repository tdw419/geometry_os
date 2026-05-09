; DESCRIPTION: Renders a green box of size 38x115 starting at (54, 116).
; PLAN: r0=54(x), r1=116(y), r2=38(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 116
LDI r2, 38
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
