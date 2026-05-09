; DESCRIPTION: Places a cyan 78x82 rectangle at position (130, 72).
; PLAN: r0=130(x), r1=72(y), r2=78(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 72
LDI r2, 78
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
