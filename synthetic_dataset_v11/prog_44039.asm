; DESCRIPTION: Renders a red box of size 42x58 starting at (21, 177).
; PLAN: r0=21(x), r1=177(y), r2=42(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 177
LDI r2, 42
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
