; DESCRIPTION: Places a white 11x82 rectangle at position (190, 92).
; PLAN: r0=190(x), r1=92(y), r2=11(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 92
LDI r2, 11
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
