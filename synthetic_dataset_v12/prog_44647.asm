; DESCRIPTION: Places a yellow 66x113 rectangle at position (210, 26).
; PLAN: r0=210(x), r1=26(y), r2=66(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 26
LDI r2, 66
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
