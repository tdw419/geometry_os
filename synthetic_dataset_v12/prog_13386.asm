; DESCRIPTION: Places a yellow 114x115 rectangle at position (398, 99).
; PLAN: r0=398(x), r1=99(y), r2=114(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 99
LDI r2, 114
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
