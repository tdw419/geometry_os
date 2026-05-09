; DESCRIPTION: Places a white 36x103 rectangle at position (417, 33).
; PLAN: r0=417(x), r1=33(y), r2=36(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 33
LDI r2, 36
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
