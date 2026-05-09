; DESCRIPTION: Places a black 60x21 rectangle at position (150, 135).
; PLAN: r0=150(x), r1=135(y), r2=60(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 135
LDI r2, 60
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
