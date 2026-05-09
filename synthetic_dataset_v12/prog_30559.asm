; DESCRIPTION: Places a black 38x65 rectangle at position (365, 124).
; PLAN: r0=365(x), r1=124(y), r2=38(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 124
LDI r2, 38
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
