; DESCRIPTION: Renders a red box of size 87x115 starting at (263, 61).
; PLAN: r0=263(x), r1=61(y), r2=87(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 61
LDI r2, 87
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
