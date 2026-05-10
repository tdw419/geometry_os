; DESCRIPTION: Places a yellow 29x24 rectangle at position (378, 16).
; PLAN: r0=378(x), r1=16(y), r2=29(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 16
LDI r2, 29
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
