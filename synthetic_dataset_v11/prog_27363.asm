; DESCRIPTION: Renders a red box of size 42x17 starting at (206, 60).
; PLAN: r0=206(x), r1=60(y), r2=42(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 60
LDI r2, 42
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
