; DESCRIPTION: Places a cyan 86x98 rectangle at position (209, 4).
; PLAN: r0=209(x), r1=4(y), r2=86(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 4
LDI r2, 86
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
