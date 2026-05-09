; DESCRIPTION: Places a blue 25x28 rectangle at position (154, 144).
; PLAN: r0=154(x), r1=144(y), r2=25(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 144
LDI r2, 25
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
