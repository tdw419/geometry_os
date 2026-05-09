; DESCRIPTION: Renders a red box of size 62x31 starting at (284, 93).
; PLAN: r0=284(x), r1=93(y), r2=62(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 93
LDI r2, 62
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
