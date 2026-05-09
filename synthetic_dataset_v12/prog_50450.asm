; DESCRIPTION: Places a cyan 96x73 rectangle at position (193, 161).
; PLAN: r0=193(x), r1=161(y), r2=96(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 161
LDI r2, 96
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
