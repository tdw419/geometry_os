; DESCRIPTION: Places a cyan 42x99 rectangle at position (163, 148).
; PLAN: r0=163(x), r1=148(y), r2=42(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 148
LDI r2, 42
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
