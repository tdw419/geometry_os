; DESCRIPTION: Renders a red box of size 44x64 starting at (95, 58).
; PLAN: r0=95(x), r1=58(y), r2=44(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 58
LDI r2, 44
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
