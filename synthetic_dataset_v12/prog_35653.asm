; DESCRIPTION: Creates a white rectangular region at (259, 195) spanning 94 by 60 pixels.
; PLAN: r0=259(x), r1=195(y), r2=94(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 195
LDI r2, 94
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
