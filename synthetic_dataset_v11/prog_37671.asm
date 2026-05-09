; DESCRIPTION: Creates a white rectangular region at (92, 120) spanning 40 by 18 pixels.
; PLAN: r0=92(x), r1=120(y), r2=40(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 120
LDI r2, 40
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
