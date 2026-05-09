; DESCRIPTION: Places a cyan 98x47 rectangle at position (33, 201).
; PLAN: r0=33(x), r1=201(y), r2=98(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 201
LDI r2, 98
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
