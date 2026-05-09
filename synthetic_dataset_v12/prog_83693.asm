; DESCRIPTION: Renders a red box of size 48x47 starting at (402, 42).
; PLAN: r0=402(x), r1=42(y), r2=48(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 42
LDI r2, 48
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
