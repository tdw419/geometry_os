; DESCRIPTION: Places a cyan 72x105 rectangle at position (351, 37).
; PLAN: r0=351(x), r1=37(y), r2=72(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 37
LDI r2, 72
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
