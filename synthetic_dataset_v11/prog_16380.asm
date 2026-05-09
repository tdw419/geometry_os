; DESCRIPTION: Creates a white rectangular region at (224, 126) spanning 20 by 79 pixels.
; PLAN: r0=224(x), r1=126(y), r2=20(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 126
LDI r2, 20
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
