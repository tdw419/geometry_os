; DESCRIPTION: Creates a cyan rectangular region at (275, 187) spanning 96 by 18 pixels.
; PLAN: r0=275(x), r1=187(y), r2=96(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 187
LDI r2, 96
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
