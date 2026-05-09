; DESCRIPTION: Creates a cyan rectangular region at (386, 193) spanning 72 by 21 pixels.
; PLAN: r0=386(x), r1=193(y), r2=72(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 193
LDI r2, 72
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
