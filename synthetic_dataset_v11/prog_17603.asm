; DESCRIPTION: Creates a orange rectangular region at (198, 82) spanning 44 by 48 pixels.
; PLAN: r0=198(x), r1=82(y), r2=44(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 82
LDI r2, 44
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
