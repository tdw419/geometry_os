; DESCRIPTION: Places a yellow 50x42 rectangle at position (24, 56).
; PLAN: r0=24(x), r1=56(y), r2=50(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 56
LDI r2, 50
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
