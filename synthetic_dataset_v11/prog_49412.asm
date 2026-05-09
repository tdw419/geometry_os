; DESCRIPTION: Places a white 71x27 rectangle at position (82, 205).
; PLAN: r0=82(x), r1=205(y), r2=71(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 205
LDI r2, 71
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
