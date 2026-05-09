; DESCRIPTION: Places a magenta 75x18 rectangle at position (122, 174).
; PLAN: r0=122(x), r1=174(y), r2=75(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 174
LDI r2, 75
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
