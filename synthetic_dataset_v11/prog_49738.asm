; DESCRIPTION: Places a black 50x78 rectangle at position (175, 83).
; PLAN: r0=175(x), r1=83(y), r2=50(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 83
LDI r2, 50
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
