; DESCRIPTION: Creates a orange rectangular region at (224, 38) spanning 120 by 65 pixels.
; PLAN: r0=224(x), r1=38(y), r2=120(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 38
LDI r2, 120
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
