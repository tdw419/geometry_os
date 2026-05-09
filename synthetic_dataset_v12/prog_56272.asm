; DESCRIPTION: Renders a black box of size 89x95 starting at (408, 37).
; PLAN: r0=408(x), r1=37(y), r2=89(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 37
LDI r2, 89
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
