; DESCRIPTION: Renders a black box of size 31x47 starting at (137, 82).
; PLAN: r0=137(x), r1=82(y), r2=31(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 82
LDI r2, 31
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
