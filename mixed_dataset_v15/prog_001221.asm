; DESCRIPTION: Renders a black box of size 47x102 starting at (439, 95).
; PLAN: r0=439(x), r1=95(y), r2=47(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 95
LDI r2, 47
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
