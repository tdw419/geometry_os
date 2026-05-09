; DESCRIPTION: Places a cyan 92x13 rectangle at position (285, 176).
; PLAN: r0=285(x), r1=176(y), r2=92(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 176
LDI r2, 92
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
