; DESCRIPTION: Places a orange 83x71 rectangle at position (373, 117).
; PLAN: r0=373(x), r1=117(y), r2=83(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 117
LDI r2, 83
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
