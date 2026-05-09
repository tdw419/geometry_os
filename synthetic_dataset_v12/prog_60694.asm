; DESCRIPTION: Places a black 57x120 rectangle at position (286, 19).
; PLAN: r0=286(x), r1=19(y), r2=57(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 19
LDI r2, 57
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
