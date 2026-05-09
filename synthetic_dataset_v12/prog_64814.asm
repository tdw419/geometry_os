; DESCRIPTION: Places a cyan 17x26 rectangle at position (177, 42).
; PLAN: r0=177(x), r1=42(y), r2=17(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 42
LDI r2, 17
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
