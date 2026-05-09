; DESCRIPTION: Renders a red box of size 95x47 starting at (98, 28).
; PLAN: r0=98(x), r1=28(y), r2=95(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 28
LDI r2, 95
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
