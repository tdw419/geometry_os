; DESCRIPTION: Creates a cyan rectangular region at (422, 8) spanning 33 by 30 pixels.
; PLAN: r0=422(x), r1=8(y), r2=33(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 8
LDI r2, 33
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
