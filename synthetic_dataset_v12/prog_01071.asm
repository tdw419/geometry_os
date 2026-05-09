; DESCRIPTION: Places a magenta 29x110 rectangle at position (346, 86).
; PLAN: r0=346(x), r1=86(y), r2=29(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 86
LDI r2, 29
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
