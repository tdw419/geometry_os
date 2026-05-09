; DESCRIPTION: Places a orange 65x31 rectangle at position (299, 202).
; PLAN: r0=299(x), r1=202(y), r2=65(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 202
LDI r2, 65
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
