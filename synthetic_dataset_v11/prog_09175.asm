; DESCRIPTION: Renders a red box of size 50x60 starting at (21, 68).
; PLAN: r0=21(x), r1=68(y), r2=50(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 68
LDI r2, 50
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
