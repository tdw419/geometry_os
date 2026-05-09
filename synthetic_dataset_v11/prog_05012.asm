; DESCRIPTION: Places a green 20x47 rectangle at position (45, 42).
; PLAN: r0=45(x), r1=42(y), r2=20(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 42
LDI r2, 20
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
