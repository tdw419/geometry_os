; DESCRIPTION: Renders a red box of size 68x50 starting at (271, 193).
; PLAN: r0=271(x), r1=193(y), r2=68(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 193
LDI r2, 68
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
