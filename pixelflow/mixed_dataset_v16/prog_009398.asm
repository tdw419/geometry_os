; DESCRIPTION: Places a green 60x41 rectangle at position (406, 142).
; PLAN: r0=406(x), r1=142(y), r2=60(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 142
LDI r2, 60
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
