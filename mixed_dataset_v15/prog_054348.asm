; DESCRIPTION: Places a orange 70x34 rectangle at position (303, 8).
; PLAN: r0=303(x), r1=8(y), r2=70(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 8
LDI r2, 70
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
