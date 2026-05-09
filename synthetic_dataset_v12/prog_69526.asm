; DESCRIPTION: Renders a red box of size 30x37 starting at (436, 42).
; PLAN: r0=436(x), r1=42(y), r2=30(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 42
LDI r2, 30
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
