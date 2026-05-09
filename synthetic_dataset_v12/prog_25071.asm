; DESCRIPTION: Creates a cyan rectangular region at (46, 47) spanning 27 by 23 pixels.
; PLAN: r0=46(x), r1=47(y), r2=27(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 47
LDI r2, 27
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
