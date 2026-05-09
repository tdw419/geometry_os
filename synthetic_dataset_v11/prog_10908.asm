; DESCRIPTION: Places a cyan 73x71 rectangle at position (164, 158).
; PLAN: r0=164(x), r1=158(y), r2=73(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 158
LDI r2, 73
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
