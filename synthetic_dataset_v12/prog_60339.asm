; DESCRIPTION: Places a orange 103x11 rectangle at position (278, 187).
; PLAN: r0=278(x), r1=187(y), r2=103(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 187
LDI r2, 103
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
