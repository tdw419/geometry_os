; DESCRIPTION: Places a white 34x36 rectangle at position (164, 201).
; PLAN: r0=164(x), r1=201(y), r2=34(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 201
LDI r2, 34
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
