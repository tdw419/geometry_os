; DESCRIPTION: Renders a white rectangular region spanning 45 by 97 at (224, 73).
; PLAN: r0=224(x), r1=73(y), r2=45(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 73
LDI r2, 45
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
