; DESCRIPTION: Places a cyan 82x57 rectangle at position (378, 137).
; PLAN: r0=378(x), r1=137(y), r2=82(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 137
LDI r2, 82
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
