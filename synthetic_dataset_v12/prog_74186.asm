; DESCRIPTION: Renders a red box of size 27x73 starting at (168, 100).
; PLAN: r0=168(x), r1=100(y), r2=27(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 100
LDI r2, 27
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
