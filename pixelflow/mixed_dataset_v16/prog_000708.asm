; DESCRIPTION: Places a blue 53x13 rectangle at position (246, 174).
; PLAN: r0=246(x), r1=174(y), r2=53(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 174
LDI r2, 53
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
