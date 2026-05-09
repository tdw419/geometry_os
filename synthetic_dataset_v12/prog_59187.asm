; DESCRIPTION: Places a orange 50x20 rectangle at position (103, 18).
; PLAN: r0=103(x), r1=18(y), r2=50(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 18
LDI r2, 50
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
