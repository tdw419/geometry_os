; DESCRIPTION: Renders a black box of size 94x115 starting at (304, 26).
; PLAN: r0=304(x), r1=26(y), r2=94(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 26
LDI r2, 94
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
