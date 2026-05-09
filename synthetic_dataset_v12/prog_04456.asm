; DESCRIPTION: Places a green 41x21 rectangle at position (109, 87).
; PLAN: r0=109(x), r1=87(y), r2=41(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 87
LDI r2, 41
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
