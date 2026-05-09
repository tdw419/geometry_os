; DESCRIPTION: Places a orange 14x120 rectangle at position (423, 91).
; PLAN: r0=423(x), r1=91(y), r2=14(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 91
LDI r2, 14
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
