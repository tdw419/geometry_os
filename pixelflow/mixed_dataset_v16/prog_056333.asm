; DESCRIPTION: Places a white 58x43 rectangle at position (94, 200).
; PLAN: r0=94(x), r1=200(y), r2=58(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 200
LDI r2, 58
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
