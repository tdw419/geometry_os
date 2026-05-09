; DESCRIPTION: Places a white 82x94 rectangle at position (153, 161).
; PLAN: r0=153(x), r1=161(y), r2=82(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 161
LDI r2, 82
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
