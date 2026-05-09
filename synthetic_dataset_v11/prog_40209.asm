; DESCRIPTION: Creates a white rectangular region at (126, 37) spanning 50 by 21 pixels.
; PLAN: r0=126(x), r1=37(y), r2=50(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 37
LDI r2, 50
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
