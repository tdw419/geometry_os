; DESCRIPTION: Places a green 87x10 rectangle at position (44, 209).
; PLAN: r0=44(x), r1=209(y), r2=87(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 209
LDI r2, 87
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
