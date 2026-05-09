; DESCRIPTION: Places a blue 25x59 rectangle at position (87, 154).
; PLAN: r0=87(x), r1=154(y), r2=25(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 154
LDI r2, 25
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
