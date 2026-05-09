; DESCRIPTION: Places a cyan 59x14 rectangle at position (380, 66).
; PLAN: r0=380(x), r1=66(y), r2=59(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 66
LDI r2, 59
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
