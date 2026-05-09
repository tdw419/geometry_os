; DESCRIPTION: Creates a white rectangular region at (61, 72) spanning 10 by 48 pixels.
; PLAN: r0=61(x), r1=72(y), r2=10(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 72
LDI r2, 10
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
