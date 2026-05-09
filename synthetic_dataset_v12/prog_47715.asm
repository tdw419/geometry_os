; DESCRIPTION: Renders a red box of size 56x57 starting at (379, 139).
; PLAN: r0=379(x), r1=139(y), r2=56(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 139
LDI r2, 56
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
