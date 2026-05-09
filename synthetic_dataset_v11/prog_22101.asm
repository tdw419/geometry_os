; DESCRIPTION: Places a green 106x60 rectangle at position (136, 42).
; PLAN: r0=136(x), r1=42(y), r2=106(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 42
LDI r2, 106
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
