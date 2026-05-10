; DESCRIPTION: Places a red 60x18 rectangle at position (255, 73).
; PLAN: r0=255(x), r1=73(y), r2=60(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 73
LDI r2, 60
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
