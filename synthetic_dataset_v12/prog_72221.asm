; DESCRIPTION: Creates a cyan rectangular region at (354, 66) spanning 40 by 104 pixels.
; PLAN: r0=354(x), r1=66(y), r2=40(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 66
LDI r2, 40
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
