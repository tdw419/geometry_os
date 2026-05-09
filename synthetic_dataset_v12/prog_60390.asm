; DESCRIPTION: Creates a cyan rectangular region at (469, 202) spanning 21 by 45 pixels.
; PLAN: r0=469(x), r1=202(y), r2=21(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 202
LDI r2, 21
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
