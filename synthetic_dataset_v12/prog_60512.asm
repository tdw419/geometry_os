; DESCRIPTION: Places a orange 89x65 rectangle at position (160, 190).
; PLAN: r0=160(x), r1=190(y), r2=89(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 190
LDI r2, 89
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
