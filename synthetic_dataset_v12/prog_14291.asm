; DESCRIPTION: Creates a white rectangular region at (109, 61) spanning 111 by 120 pixels.
; PLAN: r0=109(x), r1=61(y), r2=111(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 61
LDI r2, 111
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
