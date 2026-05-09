; DESCRIPTION: Places a black 33x14 rectangle at position (374, 230).
; PLAN: r0=374(x), r1=230(y), r2=33(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 230
LDI r2, 33
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
