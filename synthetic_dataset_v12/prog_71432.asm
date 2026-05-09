; DESCRIPTION: Creates a cyan rectangular region at (119, 107) spanning 72 by 103 pixels.
; PLAN: r0=119(x), r1=107(y), r2=72(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 107
LDI r2, 72
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
