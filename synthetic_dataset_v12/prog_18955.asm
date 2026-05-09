; DESCRIPTION: Creates a orange rectangular region at (450, 57) spanning 32 by 80 pixels.
; PLAN: r0=450(x), r1=57(y), r2=32(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 57
LDI r2, 32
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
