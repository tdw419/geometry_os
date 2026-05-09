; DESCRIPTION: Renders a red box of size 98x29 starting at (82, 61).
; PLAN: r0=82(x), r1=61(y), r2=98(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 61
LDI r2, 98
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
