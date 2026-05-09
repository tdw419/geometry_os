; DESCRIPTION: Places a cyan 19x95 rectangle at position (261, 123).
; PLAN: r0=261(x), r1=123(y), r2=19(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 123
LDI r2, 19
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
