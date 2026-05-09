; DESCRIPTION: Places a green 42x109 rectangle at position (118, 96).
; PLAN: r0=118(x), r1=96(y), r2=42(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 96
LDI r2, 42
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
