; DESCRIPTION: Creates a orange rectangular region at (59, 190) spanning 90 by 58 pixels.
; PLAN: r0=59(x), r1=190(y), r2=90(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 190
LDI r2, 90
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
