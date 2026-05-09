; DESCRIPTION: Places a green 109x12 rectangle at position (241, 124).
; PLAN: r0=241(x), r1=124(y), r2=109(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 124
LDI r2, 109
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
