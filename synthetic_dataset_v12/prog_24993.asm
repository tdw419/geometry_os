; DESCRIPTION: Creates a white rectangular region at (279, 87) spanning 27 by 120 pixels.
; PLAN: r0=279(x), r1=87(y), r2=27(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 87
LDI r2, 27
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
