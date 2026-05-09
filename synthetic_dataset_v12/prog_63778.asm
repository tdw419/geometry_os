; DESCRIPTION: Places a cyan 58x76 rectangle at position (143, 162).
; PLAN: r0=143(x), r1=162(y), r2=58(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 162
LDI r2, 58
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
