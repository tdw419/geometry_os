; DESCRIPTION: Places a black 115x60 rectangle at position (46, 161).
; PLAN: r0=46(x), r1=161(y), r2=115(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 161
LDI r2, 115
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
