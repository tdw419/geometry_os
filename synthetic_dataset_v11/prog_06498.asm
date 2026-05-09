; DESCRIPTION: Places a green 107x47 rectangle at position (109, 124).
; PLAN: r0=109(x), r1=124(y), r2=107(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 124
LDI r2, 107
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
