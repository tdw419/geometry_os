; DESCRIPTION: Places a red 37x50 rectangle at position (125, 13).
; PLAN: r0=125(x), r1=13(y), r2=37(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 13
LDI r2, 37
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
