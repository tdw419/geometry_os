; DESCRIPTION: Creates a cyan rectangular region at (207, 50) spanning 34 by 29 pixels.
; PLAN: r0=207(x), r1=50(y), r2=34(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 50
LDI r2, 34
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
