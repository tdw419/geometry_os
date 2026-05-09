; DESCRIPTION: Places a yellow 25x94 rectangle at position (308, 39).
; PLAN: r0=308(x), r1=39(y), r2=25(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 39
LDI r2, 25
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
