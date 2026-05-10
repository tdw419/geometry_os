; DESCRIPTION: Places a black 36x32 rectangle at position (342, 118).
; PLAN: r0=342(x), r1=118(y), r2=36(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 118
LDI r2, 36
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
