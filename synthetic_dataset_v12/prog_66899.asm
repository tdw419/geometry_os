; DESCRIPTION: Places a blue 75x10 rectangle at position (6, 174).
; PLAN: r0=6(x), r1=174(y), r2=75(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 174
LDI r2, 75
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
