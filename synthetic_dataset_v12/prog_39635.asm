; DESCRIPTION: Places a blue 116x54 rectangle at position (373, 71).
; PLAN: r0=373(x), r1=71(y), r2=116(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 71
LDI r2, 116
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
