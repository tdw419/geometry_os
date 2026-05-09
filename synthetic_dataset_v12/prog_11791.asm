; DESCRIPTION: Places a orange 38x45 rectangle at position (437, 46).
; PLAN: r0=437(x), r1=46(y), r2=38(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 46
LDI r2, 38
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
