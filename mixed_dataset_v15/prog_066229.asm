; DESCRIPTION: Places a white 118x34 rectangle at position (80, 50).
; PLAN: r0=80(x), r1=50(y), r2=118(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 50
LDI r2, 118
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
