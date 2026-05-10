; DESCRIPTION: Creates a white filled rectangle of size 75x116 starting at (255, 116).
; PLAN: r0=255(x), r1=116(y), r2=75(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 116
LDI r2, 75
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
