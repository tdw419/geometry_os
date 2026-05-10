; DESCRIPTION: Places a cyan 73x23 rectangle at position (176, 170).
; PLAN: r0=176(x), r1=170(y), r2=73(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 170
LDI r2, 73
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
