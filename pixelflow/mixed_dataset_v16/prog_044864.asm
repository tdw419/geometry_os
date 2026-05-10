; DESCRIPTION: Creates a cyan rectangular region at (213, 57) spanning 80 by 41 pixels.
; PLAN: r0=213(x), r1=57(y), r2=80(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 57
LDI r2, 80
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
