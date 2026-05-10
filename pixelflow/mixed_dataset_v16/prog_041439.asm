; DESCRIPTION: Places a black 81x11 rectangle at position (295, 204).
; PLAN: r0=295(x), r1=204(y), r2=81(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 204
LDI r2, 81
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
