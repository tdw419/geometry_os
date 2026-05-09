; DESCRIPTION: Creates a orange rectangular region at (230, 47) spanning 82 by 103 pixels.
; PLAN: r0=230(x), r1=47(y), r2=82(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 47
LDI r2, 82
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
