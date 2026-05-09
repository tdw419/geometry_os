; DESCRIPTION: Places a orange 86x115 rectangle at position (146, 49).
; PLAN: r0=146(x), r1=49(y), r2=86(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 49
LDI r2, 86
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
