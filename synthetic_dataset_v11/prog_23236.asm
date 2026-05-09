; DESCRIPTION: Renders a red box of size 57x19 starting at (168, 84).
; PLAN: r0=168(x), r1=84(y), r2=57(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 84
LDI r2, 57
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
