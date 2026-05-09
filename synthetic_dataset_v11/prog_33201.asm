; DESCRIPTION: Creates a cyan rectangular region at (196, 11) spanning 26 by 107 pixels.
; PLAN: r0=196(x), r1=11(y), r2=26(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 11
LDI r2, 26
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
