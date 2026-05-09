; DESCRIPTION: Places a cyan 15x14 rectangle at position (48, 161).
; PLAN: r0=48(x), r1=161(y), r2=15(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 161
LDI r2, 15
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
