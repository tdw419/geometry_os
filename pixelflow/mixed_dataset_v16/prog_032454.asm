; DESCRIPTION: Creates a cyan rectangular region at (392, 63) spanning 84 by 101 pixels.
; PLAN: r0=392(x), r1=63(y), r2=84(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 63
LDI r2, 84
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
