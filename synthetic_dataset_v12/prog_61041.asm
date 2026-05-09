; DESCRIPTION: Places a cyan 19x18 rectangle at position (166, 59).
; PLAN: r0=166(x), r1=59(y), r2=19(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 59
LDI r2, 19
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
