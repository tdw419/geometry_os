; DESCRIPTION: Creates a cyan rectangular region at (404, 21) spanning 99 by 46 pixels.
; PLAN: r0=404(x), r1=21(y), r2=99(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 21
LDI r2, 99
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
