; DESCRIPTION: Creates a orange rectangular region at (214, 131) spanning 104 by 118 pixels.
; PLAN: r0=214(x), r1=131(y), r2=104(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 131
LDI r2, 104
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
