; DESCRIPTION: Places a cyan 15x65 rectangle at position (15, 114).
; PLAN: r0=15(x), r1=114(y), r2=15(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 114
LDI r2, 15
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
