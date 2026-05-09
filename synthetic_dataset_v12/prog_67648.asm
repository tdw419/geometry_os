; DESCRIPTION: Creates a cyan rectangular region at (132, 87) spanning 50 by 39 pixels.
; PLAN: r0=132(x), r1=87(y), r2=50(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 87
LDI r2, 50
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
