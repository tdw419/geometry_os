; DESCRIPTION: Places a yellow 89x55 rectangle at position (211, 190).
; PLAN: r0=211(x), r1=190(y), r2=89(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 190
LDI r2, 89
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
