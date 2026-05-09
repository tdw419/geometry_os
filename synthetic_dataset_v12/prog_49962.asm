; DESCRIPTION: Places a black 106x115 rectangle at position (255, 37).
; PLAN: r0=255(x), r1=37(y), r2=106(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 37
LDI r2, 106
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
