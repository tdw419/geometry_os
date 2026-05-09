; DESCRIPTION: Places a orange 59x21 rectangle at position (12, 164).
; PLAN: r0=12(x), r1=164(y), r2=59(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 164
LDI r2, 59
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
