; DESCRIPTION: Places a black 73x48 rectangle at position (46, 35).
; PLAN: r0=46(x), r1=35(y), r2=73(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 35
LDI r2, 73
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
