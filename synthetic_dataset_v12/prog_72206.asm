; DESCRIPTION: Creates a cyan rectangular region at (223, 205) spanning 98 by 27 pixels.
; PLAN: r0=223(x), r1=205(y), r2=98(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 205
LDI r2, 98
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
