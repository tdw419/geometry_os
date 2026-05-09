; DESCRIPTION: Creates a cyan rectangular region at (56, 59) spanning 104 by 100 pixels.
; PLAN: r0=56(x), r1=59(y), r2=104(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 59
LDI r2, 104
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
