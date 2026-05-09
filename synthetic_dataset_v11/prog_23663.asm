; DESCRIPTION: Creates a orange rectangular region at (59, 124) spanning 58 by 117 pixels.
; PLAN: r0=59(x), r1=124(y), r2=58(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 124
LDI r2, 58
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
