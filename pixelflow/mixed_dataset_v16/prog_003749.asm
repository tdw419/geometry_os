; DESCRIPTION: Creates a orange rectangular region at (300, 177) spanning 42 by 65 pixels.
; PLAN: r0=300(x), r1=177(y), r2=42(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 177
LDI r2, 42
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
