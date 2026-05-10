; DESCRIPTION: Places a white 96x37 rectangle at position (252, 190).
; PLAN: r0=252(x), r1=190(y), r2=96(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 190
LDI r2, 96
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
