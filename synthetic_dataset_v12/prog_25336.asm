; DESCRIPTION: Places a green 52x110 rectangle at position (219, 42).
; PLAN: r0=219(x), r1=42(y), r2=52(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 42
LDI r2, 52
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
