; DESCRIPTION: Places a red 50x33 rectangle at position (115, 30).
; PLAN: r0=115(x), r1=30(y), r2=50(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 30
LDI r2, 50
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
