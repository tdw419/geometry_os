; DESCRIPTION: Places a white 38x68 rectangle at position (63, 81).
; PLAN: r0=63(x), r1=81(y), r2=38(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 81
LDI r2, 38
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
