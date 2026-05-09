; DESCRIPTION: Places a white 115x98 rectangle at position (176, 103).
; PLAN: r0=176(x), r1=103(y), r2=115(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 103
LDI r2, 115
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
