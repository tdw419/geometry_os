; DESCRIPTION: Creates a cyan rectangular region at (132, 136) spanning 77 by 90 pixels.
; PLAN: r0=132(x), r1=136(y), r2=77(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 136
LDI r2, 77
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
