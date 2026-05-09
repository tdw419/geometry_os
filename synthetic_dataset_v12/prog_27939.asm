; DESCRIPTION: Creates a orange rectangular region at (412, 129) spanning 79 by 100 pixels.
; PLAN: r0=412(x), r1=129(y), r2=79(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 129
LDI r2, 79
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
