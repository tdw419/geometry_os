; DESCRIPTION: Places a cyan 97x23 rectangle at position (368, 6).
; PLAN: r0=368(x), r1=6(y), r2=97(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 6
LDI r2, 97
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
