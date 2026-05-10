; DESCRIPTION: Places a cyan 29x57 rectangle at position (332, 9).
; PLAN: r0=332(x), r1=9(y), r2=29(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 9
LDI r2, 29
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
