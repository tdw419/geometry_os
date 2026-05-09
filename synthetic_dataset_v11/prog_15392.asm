; DESCRIPTION: Places a black 40x98 rectangle at position (48, 43).
; PLAN: r0=48(x), r1=43(y), r2=40(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 43
LDI r2, 40
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
