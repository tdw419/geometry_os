; DESCRIPTION: Places a black 10x46 rectangle at position (57, 31).
; PLAN: r0=57(x), r1=31(y), r2=10(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 31
LDI r2, 10
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
