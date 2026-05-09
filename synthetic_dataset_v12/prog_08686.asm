; DESCRIPTION: Creates a cyan rectangular region at (440, 48) spanning 70 by 27 pixels.
; PLAN: r0=440(x), r1=48(y), r2=70(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 48
LDI r2, 70
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
