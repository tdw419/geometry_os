; DESCRIPTION: Renders a red box of size 73x86 starting at (212, 153).
; PLAN: r0=212(x), r1=153(y), r2=73(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 153
LDI r2, 73
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
