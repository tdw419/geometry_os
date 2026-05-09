; DESCRIPTION: Creates a white rectangular region at (350, 132) spanning 47 by 120 pixels.
; PLAN: r0=350(x), r1=132(y), r2=47(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 132
LDI r2, 47
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
