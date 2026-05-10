; DESCRIPTION: Places a yellow 95x27 box at position (14, 42).
; PLAN: r0=14(x), r1=42(y), r2=95(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 42
LDI r2, 95
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
