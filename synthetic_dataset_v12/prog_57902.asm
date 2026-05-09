; DESCRIPTION: Creates a orange rectangular region at (242, 177) spanning 109 by 76 pixels.
; PLAN: r0=242(x), r1=177(y), r2=109(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 177
LDI r2, 109
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
