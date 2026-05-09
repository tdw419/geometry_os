; DESCRIPTION: Places a cyan 19x76 rectangle at position (286, 90).
; PLAN: r0=286(x), r1=90(y), r2=19(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 90
LDI r2, 19
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
