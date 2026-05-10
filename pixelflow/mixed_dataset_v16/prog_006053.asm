; DESCRIPTION: Places a black 47x76 rectangle at position (175, 36).
; PLAN: r0=175(x), r1=36(y), r2=47(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 36
LDI r2, 47
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
