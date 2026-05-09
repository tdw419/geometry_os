; DESCRIPTION: Places a cyan 30x113 rectangle at position (155, 77).
; PLAN: r0=155(x), r1=77(y), r2=30(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 77
LDI r2, 30
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
