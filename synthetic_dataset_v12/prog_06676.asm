; DESCRIPTION: Places a black 24x34 rectangle at position (315, 57).
; PLAN: r0=315(x), r1=57(y), r2=24(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 57
LDI r2, 24
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
