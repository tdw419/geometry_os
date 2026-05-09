; DESCRIPTION: Places a yellow 74x95 rectangle at position (197, 15).
; PLAN: r0=197(x), r1=15(y), r2=74(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 15
LDI r2, 74
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
