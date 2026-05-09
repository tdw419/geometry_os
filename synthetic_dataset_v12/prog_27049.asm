; DESCRIPTION: Places a cyan 55x15 rectangle at position (149, 33).
; PLAN: r0=149(x), r1=33(y), r2=55(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 33
LDI r2, 55
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
