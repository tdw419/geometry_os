; DESCRIPTION: Creates a orange rectangular region at (255, 70) spanning 54 by 44 pixels.
; PLAN: r0=255(x), r1=70(y), r2=54(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 70
LDI r2, 54
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
