; DESCRIPTION: Renders a orange box of size 14x103 starting at (87, 142).
; PLAN: r0=87(x), r1=142(y), r2=14(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 142
LDI r2, 14
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
