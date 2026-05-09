; DESCRIPTION: Places a orange 24x76 rectangle at position (24, 117).
; PLAN: r0=24(x), r1=117(y), r2=24(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 117
LDI r2, 24
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
