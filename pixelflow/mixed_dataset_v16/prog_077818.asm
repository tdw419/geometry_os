; DESCRIPTION: Creates a cyan rectangular region at (401, 181) spanning 104 by 18 pixels.
; PLAN: r0=401(x), r1=181(y), r2=104(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 181
LDI r2, 104
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
