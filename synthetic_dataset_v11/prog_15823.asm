; DESCRIPTION: Creates a red rectangular region at (50, 148) spanning 98 by 104 pixels.
; PLAN: r0=50(x), r1=148(y), r2=98(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 148
LDI r2, 98
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
