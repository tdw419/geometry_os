; DESCRIPTION: Renders a red box of size 66x64 starting at (266, 186).
; PLAN: r0=266(x), r1=186(y), r2=66(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 186
LDI r2, 66
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
