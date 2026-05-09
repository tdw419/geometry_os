; DESCRIPTION: Places a cyan 21x118 rectangle at position (286, 56).
; PLAN: r0=286(x), r1=56(y), r2=21(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 56
LDI r2, 21
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
