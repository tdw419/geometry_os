; DESCRIPTION: Creates a cyan rectangular region at (142, 159) spanning 104 by 95 pixels.
; PLAN: r0=142(x), r1=159(y), r2=104(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 159
LDI r2, 104
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
