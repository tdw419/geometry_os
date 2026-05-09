; DESCRIPTION: Places a orange 33x50 rectangle at position (330, 176).
; PLAN: r0=330(x), r1=176(y), r2=33(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 176
LDI r2, 33
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
