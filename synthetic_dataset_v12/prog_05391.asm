; DESCRIPTION: Creates a cyan rectangular region at (465, 187) spanning 29 by 45 pixels.
; PLAN: r0=465(x), r1=187(y), r2=29(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 187
LDI r2, 29
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
