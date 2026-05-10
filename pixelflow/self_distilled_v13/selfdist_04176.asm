; DESCRIPTION: Places a cyan 42x22 box at position (269, 93).
; PLAN: r0=269(x), r1=93(y), r2=42(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 93
LDI r2, 42
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
