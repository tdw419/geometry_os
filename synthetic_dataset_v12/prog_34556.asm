; DESCRIPTION: Creates a orange rectangular region at (337, 154) spanning 103 by 94 pixels.
; PLAN: r0=337(x), r1=154(y), r2=103(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 154
LDI r2, 103
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
