; DESCRIPTION: Places a cyan 81x56 rectangle at position (275, 124).
; PLAN: r0=275(x), r1=124(y), r2=81(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 124
LDI r2, 81
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
