; DESCRIPTION: Renders a red box of size 119x42 starting at (113, 66).
; PLAN: r0=113(x), r1=66(y), r2=119(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 66
LDI r2, 119
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
