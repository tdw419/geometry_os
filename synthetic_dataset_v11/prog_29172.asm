; DESCRIPTION: Places a green 66x71 rectangle at position (122, 8).
; PLAN: r0=122(x), r1=8(y), r2=66(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 8
LDI r2, 66
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
