; DESCRIPTION: Places a black 60x98 rectangle at position (149, 29).
; PLAN: r0=149(x), r1=29(y), r2=60(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 29
LDI r2, 60
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
