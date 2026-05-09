; DESCRIPTION: Places a cyan 65x69 rectangle at position (119, 19).
; PLAN: r0=119(x), r1=19(y), r2=65(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 19
LDI r2, 65
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
