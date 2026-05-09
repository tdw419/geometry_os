; DESCRIPTION: Places a purple 82x90 rectangle at position (272, 0).
; PLAN: r0=272(x), r1=0(y), r2=82(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 0
LDI r2, 82
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
