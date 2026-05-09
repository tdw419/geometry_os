; DESCRIPTION: Places a blue 80x111 rectangle at position (42, 62).
; PLAN: r0=42(x), r1=62(y), r2=80(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 62
LDI r2, 80
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
