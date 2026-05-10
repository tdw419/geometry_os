; DESCRIPTION: Places a black 120x98 rectangle at position (161, 8).
; PLAN: r0=161(x), r1=8(y), r2=120(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 8
LDI r2, 120
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
