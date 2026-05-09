; DESCRIPTION: Creates a orange rectangular region at (235, 82) spanning 14 by 109 pixels.
; PLAN: r0=235(x), r1=82(y), r2=14(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 82
LDI r2, 14
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
