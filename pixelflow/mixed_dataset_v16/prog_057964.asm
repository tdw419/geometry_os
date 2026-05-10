; DESCRIPTION: Places a red 104x84 rectangle at position (12, 120).
; PLAN: r0=12(x), r1=120(y), r2=104(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 120
LDI r2, 104
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
