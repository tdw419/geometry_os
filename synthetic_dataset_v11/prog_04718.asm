; DESCRIPTION: Creates a orange rectangular region at (146, 55) spanning 22 by 111 pixels.
; PLAN: r0=146(x), r1=55(y), r2=22(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 55
LDI r2, 22
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
