; DESCRIPTION: Places a green 68x99 rectangle at position (122, 103).
; PLAN: r0=122(x), r1=103(y), r2=68(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 103
LDI r2, 68
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
