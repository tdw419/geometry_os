; DESCRIPTION: Places a cyan 73x72 rectangle at position (161, 148).
; PLAN: r0=161(x), r1=148(y), r2=73(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 148
LDI r2, 73
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
