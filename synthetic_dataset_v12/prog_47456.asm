; DESCRIPTION: Creates a orange rectangular region at (305, 111) spanning 68 by 48 pixels.
; PLAN: r0=305(x), r1=111(y), r2=68(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 111
LDI r2, 68
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
