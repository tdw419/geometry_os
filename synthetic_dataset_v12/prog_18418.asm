; DESCRIPTION: Places a black 114x25 rectangle at position (243, 37).
; PLAN: r0=243(x), r1=37(y), r2=114(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 37
LDI r2, 114
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
