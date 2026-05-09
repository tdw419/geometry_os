; DESCRIPTION: Renders a red box of size 15x77 starting at (156, 133).
; PLAN: r0=156(x), r1=133(y), r2=15(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 133
LDI r2, 15
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
