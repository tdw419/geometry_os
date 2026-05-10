; DESCRIPTION: Renders a black box of size 119x47 starting at (276, 95).
; PLAN: r0=276(x), r1=95(y), r2=119(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 95
LDI r2, 119
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
