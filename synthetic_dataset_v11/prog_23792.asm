; DESCRIPTION: Places a cyan 59x13 rectangle at position (122, 204).
; PLAN: r0=122(x), r1=204(y), r2=59(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 204
LDI r2, 59
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
