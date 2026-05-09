; DESCRIPTION: Places a cyan 117x105 rectangle at position (274, 35).
; PLAN: r0=274(x), r1=35(y), r2=117(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 35
LDI r2, 117
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
