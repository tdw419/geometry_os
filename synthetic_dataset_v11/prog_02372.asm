; DESCRIPTION: Places a red 110x32 rectangle at position (103, 98).
; PLAN: r0=103(x), r1=98(y), r2=110(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 98
LDI r2, 110
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
