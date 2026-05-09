; DESCRIPTION: Creates a cyan rectangular region at (0, 209) spanning 70 by 32 pixels.
; PLAN: r0=0(x), r1=209(y), r2=70(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 209
LDI r2, 70
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
