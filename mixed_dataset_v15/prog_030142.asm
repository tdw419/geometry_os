; DESCRIPTION: Places a cyan 13x74 rectangle at position (491, 123).
; PLAN: r0=491(x), r1=123(y), r2=13(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 123
LDI r2, 13
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
