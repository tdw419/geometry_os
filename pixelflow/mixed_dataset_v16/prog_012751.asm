; DESCRIPTION: Places a magenta 42x20 rectangle at position (223, 142).
; PLAN: r0=223(x), r1=142(y), r2=42(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 142
LDI r2, 42
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
