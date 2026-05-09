; DESCRIPTION: Places a green 85x50 rectangle at position (344, 47).
; PLAN: r0=344(x), r1=47(y), r2=85(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 47
LDI r2, 85
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
