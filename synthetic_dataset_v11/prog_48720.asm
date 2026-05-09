; DESCRIPTION: Places a black 55x60 rectangle at position (80, 158).
; PLAN: r0=80(x), r1=158(y), r2=55(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 158
LDI r2, 55
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
