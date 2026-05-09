; DESCRIPTION: Creates a orange rectangular region at (146, 169) spanning 102 by 16 pixels.
; PLAN: r0=146(x), r1=169(y), r2=102(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 169
LDI r2, 102
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
