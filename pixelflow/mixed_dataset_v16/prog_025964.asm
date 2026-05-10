; DESCRIPTION: Renders a red box of size 42x52 starting at (220, 133).
; PLAN: r0=220(x), r1=133(y), r2=42(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 133
LDI r2, 42
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
