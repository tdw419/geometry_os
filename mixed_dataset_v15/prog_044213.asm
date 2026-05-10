; DESCRIPTION: Creates a cyan rectangular region at (283, 91) spanning 59 by 112 pixels.
; PLAN: r0=283(x), r1=91(y), r2=59(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 91
LDI r2, 59
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
