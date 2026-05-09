; DESCRIPTION: Places a yellow 42x101 rectangle at position (96, 82).
; PLAN: r0=96(x), r1=82(y), r2=42(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 82
LDI r2, 42
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
