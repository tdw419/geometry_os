; DESCRIPTION: Places a green 18x44 rectangle at position (98, 138).
; PLAN: r0=98(x), r1=138(y), r2=18(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 138
LDI r2, 18
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
