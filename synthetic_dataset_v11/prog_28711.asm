; DESCRIPTION: Places a yellow 18x14 rectangle at position (207, 237).
; PLAN: r0=207(x), r1=237(y), r2=18(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 237
LDI r2, 18
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
