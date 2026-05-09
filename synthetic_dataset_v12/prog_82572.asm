; DESCRIPTION: Creates a white rectangular region at (345, 195) spanning 84 by 47 pixels.
; PLAN: r0=345(x), r1=195(y), r2=84(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 195
LDI r2, 84
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
