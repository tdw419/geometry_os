; DESCRIPTION: Creates a white rectangular region at (180, 54) spanning 109 by 23 pixels.
; PLAN: r0=180(x), r1=54(y), r2=109(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 54
LDI r2, 109
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
