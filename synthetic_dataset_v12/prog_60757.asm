; DESCRIPTION: Places a yellow 11x61 rectangle at position (306, 24).
; PLAN: r0=306(x), r1=24(y), r2=11(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 24
LDI r2, 11
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
