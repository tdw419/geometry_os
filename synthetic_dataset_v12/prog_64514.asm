; DESCRIPTION: Places a yellow 109x42 rectangle at position (196, 196).
; PLAN: r0=196(x), r1=196(y), r2=109(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 196
LDI r2, 109
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
