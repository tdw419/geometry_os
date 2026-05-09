; DESCRIPTION: Places a black 76x40 rectangle at position (178, 65).
; PLAN: r0=178(x), r1=65(y), r2=76(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 65
LDI r2, 76
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
