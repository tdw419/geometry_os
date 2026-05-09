; DESCRIPTION: Places a green 18x65 rectangle at position (41, 44).
; PLAN: r0=41(x), r1=44(y), r2=18(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 44
LDI r2, 18
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
