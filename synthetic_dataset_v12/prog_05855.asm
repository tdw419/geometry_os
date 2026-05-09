; DESCRIPTION: Creates a cyan rectangular region at (107, 97) spanning 64 by 77 pixels.
; PLAN: r0=107(x), r1=97(y), r2=64(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 97
LDI r2, 64
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
