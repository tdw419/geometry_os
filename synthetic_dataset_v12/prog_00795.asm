; DESCRIPTION: Places a white 63x87 rectangle at position (423, 167).
; PLAN: r0=423(x), r1=167(y), r2=63(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 167
LDI r2, 63
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
