; DESCRIPTION: Creates a cyan rectangular region at (109, 107) spanning 70 by 98 pixels.
; PLAN: r0=109(x), r1=107(y), r2=70(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 107
LDI r2, 70
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
