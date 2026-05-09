; DESCRIPTION: Places a blue 64x44 rectangle at position (66, 174).
; PLAN: r0=66(x), r1=174(y), r2=64(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 174
LDI r2, 64
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
