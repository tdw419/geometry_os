; DESCRIPTION: Places a orange 120x83 rectangle at position (60, 130).
; PLAN: r0=60(x), r1=130(y), r2=120(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 130
LDI r2, 120
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
