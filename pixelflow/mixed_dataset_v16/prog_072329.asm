; DESCRIPTION: Places a orange 95x24 rectangle at position (120, 117).
; PLAN: r0=120(x), r1=117(y), r2=95(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 117
LDI r2, 95
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
