; DESCRIPTION: Places a blue 55x60 rectangle at position (42, 54).
; PLAN: r0=42(x), r1=54(y), r2=55(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 54
LDI r2, 55
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
