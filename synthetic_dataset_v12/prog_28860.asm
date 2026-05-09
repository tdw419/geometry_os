; DESCRIPTION: Places a cyan 56x45 rectangle at position (319, 19).
; PLAN: r0=319(x), r1=19(y), r2=56(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 19
LDI r2, 56
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
