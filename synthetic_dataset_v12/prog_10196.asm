; DESCRIPTION: Places a black 103x37 rectangle at position (130, 75).
; PLAN: r0=130(x), r1=75(y), r2=103(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 75
LDI r2, 103
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
