; DESCRIPTION: Places a yellow 83x119 rectangle at position (90, 60).
; PLAN: r0=90(x), r1=60(y), r2=83(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 60
LDI r2, 83
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
