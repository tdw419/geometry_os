; DESCRIPTION: Creates a cyan rectangular region at (71, 159) spanning 91 by 30 pixels.
; PLAN: r0=71(x), r1=159(y), r2=91(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 159
LDI r2, 91
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
