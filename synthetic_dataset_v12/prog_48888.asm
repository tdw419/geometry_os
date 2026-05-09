; DESCRIPTION: Places a blue 18x50 rectangle at position (154, 21).
; PLAN: r0=154(x), r1=21(y), r2=18(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 21
LDI r2, 18
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
