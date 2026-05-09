; DESCRIPTION: Places a cyan 82x22 rectangle at position (261, 34).
; PLAN: r0=261(x), r1=34(y), r2=82(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 34
LDI r2, 82
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
