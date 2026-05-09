; DESCRIPTION: Places a black 65x14 rectangle at position (286, 193).
; PLAN: r0=286(x), r1=193(y), r2=65(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 193
LDI r2, 65
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
