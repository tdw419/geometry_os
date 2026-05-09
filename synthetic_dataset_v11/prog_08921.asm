; DESCRIPTION: Creates a orange rectangular region at (160, 242) spanning 50 by 12 pixels.
; PLAN: r0=160(x), r1=242(y), r2=50(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 242
LDI r2, 50
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
