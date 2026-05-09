; DESCRIPTION: Places a orange 103x10 rectangle at position (166, 142).
; PLAN: r0=166(x), r1=142(y), r2=103(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 142
LDI r2, 103
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
