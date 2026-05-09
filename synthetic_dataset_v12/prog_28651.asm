; DESCRIPTION: Places a purple 78x10 rectangle at position (281, 65).
; PLAN: r0=281(x), r1=65(y), r2=78(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 65
LDI r2, 78
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
