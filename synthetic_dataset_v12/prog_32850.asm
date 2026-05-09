; DESCRIPTION: Places a white 60x117 rectangle at position (406, 45).
; PLAN: r0=406(x), r1=45(y), r2=60(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 45
LDI r2, 60
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
