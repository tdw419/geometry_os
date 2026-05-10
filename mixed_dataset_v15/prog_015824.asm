; DESCRIPTION: Places a red 59x112 rectangle at position (364, 117).
; PLAN: r0=364(x), r1=117(y), r2=59(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 117
LDI r2, 59
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
