; DESCRIPTION: Places a yellow 106x42 rectangle at position (246, 49).
; PLAN: r0=246(x), r1=49(y), r2=106(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 49
LDI r2, 106
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
