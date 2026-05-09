; DESCRIPTION: Places a yellow 29x14 rectangle at position (454, 197).
; PLAN: r0=454(x), r1=197(y), r2=29(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 197
LDI r2, 29
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
