; DESCRIPTION: Creates a cyan rectangular region at (465, 24) spanning 12 by 77 pixels.
; PLAN: r0=465(x), r1=24(y), r2=12(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 24
LDI r2, 12
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
