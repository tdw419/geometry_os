; DESCRIPTION: Places a blue 40x110 rectangle at position (168, 143).
; PLAN: r0=168(x), r1=143(y), r2=40(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 143
LDI r2, 40
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
