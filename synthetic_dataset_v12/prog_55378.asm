; DESCRIPTION: Places a black 24x24 rectangle at position (251, 1).
; PLAN: r0=251(x), r1=1(y), r2=24(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 1
LDI r2, 24
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
