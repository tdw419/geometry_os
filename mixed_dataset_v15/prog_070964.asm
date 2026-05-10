; DESCRIPTION: Creates a white rectangular region at (446, 97) spanning 23 by 120 pixels.
; PLAN: r0=446(x), r1=97(y), r2=23(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 97
LDI r2, 23
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
