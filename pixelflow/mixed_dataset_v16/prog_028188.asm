; DESCRIPTION: Places a black 43x120 rectangle at position (18, 57).
; PLAN: r0=18(x), r1=57(y), r2=43(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 57
LDI r2, 43
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
