; DESCRIPTION: Renders a red box of size 12x22 starting at (109, 143).
; PLAN: r0=109(x), r1=143(y), r2=12(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 143
LDI r2, 12
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
