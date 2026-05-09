; DESCRIPTION: Places a black 54x96 rectangle at position (327, 149).
; PLAN: r0=327(x), r1=149(y), r2=54(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 149
LDI r2, 54
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
