; DESCRIPTION: Places a blue 106x68 rectangle at position (50, 48).
; PLAN: r0=50(x), r1=48(y), r2=106(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 48
LDI r2, 106
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
