; DESCRIPTION: Creates a cyan rectangular region at (30, 107) spanning 100 by 104 pixels.
; PLAN: r0=30(x), r1=107(y), r2=100(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 107
LDI r2, 100
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
