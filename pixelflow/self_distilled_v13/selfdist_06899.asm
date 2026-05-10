; DESCRIPTION: Places a white 11x82 box at position (269, 190).
; PLAN: r0=269(x), r1=190(y), r2=11(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 190
LDI r2, 11
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
