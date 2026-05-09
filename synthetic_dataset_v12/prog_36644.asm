; DESCRIPTION: Creates a orange rectangular region at (197, 126) spanning 22 by 55 pixels.
; PLAN: r0=197(x), r1=126(y), r2=22(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 126
LDI r2, 22
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
